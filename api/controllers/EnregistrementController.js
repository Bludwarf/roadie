/**
 * EnregistrementController
 *
 * @description :: Server-side logic for managing enregistrements
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var async = require('async');
var GroupeController = require('./GroupeController');

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

  }
};

