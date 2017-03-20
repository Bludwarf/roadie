/**
 * EnregistrementController
 *
 * @description :: Server-side logic for managing enregistrements
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var async = require('async');
var GroupeController = require('./GroupeController');
var fs = require('fs');
var https = require('follow-redirects').https;
var request = require('request');


// Google
var google = require('googleapis');
var OAuth2 = google.auth.OAuth2;

module.exports = {

  setMorceauChoix: function(req, res) {
    var groupe = req.groupe; // doit venir de setMorceau

    async.auto({
      enregistrement: function(cb) {
        return Enregistrement
          .findOne(req.params.id)
          .populate('repete')
          .exec(cb);
      },
      morceaux: function(cb) {
        return Morceau
          .find({
            groupe: groupe.id
          })
          .sort('nom')
          .exec(cb);
      }
    }, function(err, results) {

      // URL de retour
      results.from = req.query.from;

      res.view(results);
    });
  },

  setMorceau: function(req, res) {
    var ctl = this;

    GroupeController.getCurrent(req, function(err, groupe) {
      if (err) return res.serverError(err);
      req.groupe = groupe;

      // Morceau choisi
      if (typeof req.params.morceauId != 'undefined') {

        async.auto({
          enregistrement: function(cb) {
            return Enregistrement
              .findOne(req.params.id)
              //.populate('repete')
              .exec(cb);
          },
          morceau: function(cb) {
            return Morceau
              .findOne(req.params.morceauId)
              .exec(cb);
          }
        }, function(err, results) {
          if (err) return res.serverError(err);
          var enr = results.enregistrement;
          enr.morceau = results.morceau;

          // Sauvegarde
          enr.save(function(err, saved) {
            if (err) return res.serverError(err);

            // FROM URL ?
            if (req.query.from) {
              res.redirect(decodeURIComponent(req.query.from));
            }
            else {
              // TODO : retourner au morceau par exemple ou au groupe
              res.redirect('/');
            }

          });
        });

      }

      // morceau à choisir
      else {
        return ctl.setMorceauChoix(req, res);
      }
    });

  },

  /**
   * Le fichier mp3 temporairement stocké sur le serveur
   * pour éviter d'appeler trop souvent les systèmes externes comme Google Drive.
   * @param req
   *          ?filename=monFichier.mp3 => pour créer un lien téléchargeable (lecture depuis VLC par exemple)
   * @param res
   */
  mp3: function(req, res) {
    var dir = ".tmp/enregistrement";
    var tempFile = dir+'/'+req.params.id+'.mp3';

    // Création du dossier (non automatique)
    if (!fs.existsSync(dir)){
      fs.mkdirSync(dir);
    }

    // Fichier déjà existant ?
    fs.exists(tempFile, function(exists) {
      if (exists) return res.mp3(tempFile, req.query.filename);

      // Création sinon
      Enregistrement
        .findOne(req.params.id)
        //.populate('repete')
        .exec(function(err, enrSql) {

          if (err) return res.serverError(err);

          var fileId = enrSql.googleFileId;

          // lien vers le fichier non supporté
          if (!fileId) return res.notFound("Lien vers le fichier externe inconnu");

          sails.log.info("Récupération du mp3", fileId, '->', tempFile, '...');
          var dest = fs.createWriteStream(tempFile);

          // Retrieve tokens via token exchange explained above or set them:
          var confGoogle = sails.config.google;
          var oauth2Client = new OAuth2(confGoogle.client_id, confGoogle.client_secret, confGoogle.redirect_uri);

          // FIXME : download mp3 sans token (comme Google Drive)
          if (req.session.google && req.session.google.token) {
            oauth2Client.setCredentials(req.session.google.token);
          } else {
            sails.log.info("On tente de télécharger le fichier sans token en utilisant le lien d'export...");
            
            var exportUrl = 'https://docs.google.com/uc?id='+fileId+'&export=mp3';
            return request(exportUrl).pipe(dest).on('finish', function () {
              return res.mp3(tempFile, req.query.filename);    
            });
          }
          
          var drive = google.drive({version: 'v2', auth: oauth2Client});
          drive.files.get({
            fileId: fileId,
            alt: 'media'
          })
            .on('end', function() {
              sails.log.info("mp3 téléchargé dans", tempFile);
              return res.mp3(tempFile, req.query.filename);
            })
            .on('error', function(err) {
              sails.log.error('Error during download', err);
              fs.unlink(dest); // Delete the file async. (But we don't check the result) : FIXME : réalisé avant pipe car le fichier existe encore
              return res.serverError(err);
            })
            .pipe(dest);

        });

    });
  }
};

