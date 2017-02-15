/**
 * Created by mlavigne on 21/04/2016.
 *
 * Config pour l'appli roadie-1238 : https://console.developers.google.com/apis/credentials?project=roadie-1238
 */

var querystring = require('querystring');
var http = require('http');
var https = require('https');
var request = require('request');
var async = require('async');
var URL = require('url');

function getAuthUrl(req) {
  //var fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl; // http://stackoverflow.com/a/10185427/1655155
  return "https://accounts.google.com/o/oauth2/auth?" + querystring.stringify({
      redirect_uri: req.baseUrl + sails.config.google.redirect_path,
      response_type: "code",
      client_id: sails.config.google.client_id,
      scope: "https://www.googleapis.com/auth/drive",
      access_type: "offline"
    });
}

module.exports = {

  /**
   * Exemple d'appel : http://localhost:1337/google/token?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements
   *
   * 1 - Obtention d'un code : https://accounts.google.com/o/oauth2/auth?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements&response_type=code&client_id=384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline
   * 2 - Échange d'un code contre un token : https://www.googleapis.com/oauth2/v3/token
   *
   * @param req avec le paramètre
   * @param res
   */
  token: function(req, res) {
    //var fullUrl = req.protocol + '://' + req.get('host') + req.originalUrl; // http://stackoverflow.com/a/10185427/1655155

    // Conf calculée
    var confGoogle = sails.config.google;
    confGoogle.redirect_uri = req.baseUrl + confGoogle.redirect_path;

    /**
     * Token actuel
     *
     * - expires_in : secondes
     * - expires_at : date ajoutée par Roadie pour connaitre la date/heure précise d'échéance
     *
     * @type {{
      access_token: "ya29..ywKeh5B6gKndfiZAaALJ3q8LU5Mwcidijd-UrwITWN6ZXLIT0pZBWgG_14GQHn1KqS1j",
      token_type: "Bearer",
      expires_in: number,
      expires_at: Date
    }}
     */
    var token = req.session.google && req.session.google.token;

    if (!token) {
      // On a déjà un code Google on demande un token
      if (req.query && req.query.code) {

        // éviter de boucler en utilisant : req.query.redirect_uri
        console.log("token(code)", req.originalUrl);

        /**
         *
         * @param code code reçu de Google
         * @param cb
         *
         */
        function getToken(req, cb) {
          request.post("https://www.googleapis.com/oauth2/v3/token", {form: {
            code: req.query.code,
            redirect_uri: req.baseUrl + sails.config.google.redirect_path,
            client_id: sails.config.google.client_id,
            client_secret: sails.config.google.client_secret,
            scope: sails.config.google.scope,
            grant_type: "authorization_code"
          }}, function(e, res, body) {
            console.log("token body :", body);
            cb(e, JSON.parse(body));
          });
        }

        return getToken(req, function(e, token) {
          if (e || token.error) return res.status(500).send(token);

          // Ajout de la date d'expiration
          token.expires_at = new Date(new Date().getTime() + parseInt(token.expires_in) * 1000); // Date : ms | expires_in : secondes

          // On stocke le token dans la session
          req.session.google = req.session.google || {};
          req.session.google.token = token;

          // Redirect vers la page réellement demandée
          var redirect_uri = req.session.redirect_uri;
          if (redirect_uri) {
            console.log("token : on retourne à", redirect_uri);
            return res.redirect(redirect_uri);
          }

          res.send(token);
        });
      }
    }

    // Toujours valide (reste au moins 60 secondes) ?
    if (token && token.expires_at) {
      var expires_at = new Date(token.expires_at);
      var now = new Date();
      var remaining = (expires_at - now) / 1000;
      token.expires_in = remaining.toFixed(); // arrondi entier
      if (remaining >= 60) {
        return res.send(token);
      }
    }

    // On redemande un token à Monsieur Google si aucun token ou aucun code ou expiré
    var authUrl = getAuthUrl(req);
    if (req.query.socket || !res.redirect) { // http://sailsjs.com/documentation/reference/response-res/res-redirect
      res.writeHead(302, {'Location': authUrl})
      return res.end();
    }
    else {
      return res.redirect(authUrl);
    }
  }

};
