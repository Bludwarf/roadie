'use strict';
/* jshint unused:false */

module.exports = function(req, res, next) {

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

  // On vérifie que le client a un token Google sinon on en demande un à Papy Google
  if (!token) {
    req.session.redirect_uri = req.url; // Stockage de l'URL réellement demandée par le client
    return res.redirect('/google/token');
  }

  // Expiré ?
  // TODO : factoriser cette vérif avec GoogleController.token
  if (token && token.expires_at) {
      var expires_at = new Date(token.expires_at);
      var now = new Date();
      var remaining = (expires_at - now) / 1000;
      token.expires_in = remaining.toFixed(); // arrondi entier
      if (remaining >= 60) {
        delete req.session.redirect_uri;
        return next(); // token encore valide
      }
      else {
        console.error("Token expiré");
        delete req.session.google.token;
        req.session.redirect_uri = req.url; // Stockage de l'URL réellement demandée par le client
        return res.redirect('/google/token');
      }
    }
};
