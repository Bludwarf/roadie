/**
 * GroupeController
 *
 * @description :: Server-side logic for managing groupes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {

  // TODO : groupe de l'utilisateur actuellement connecté
  getCurrent: function(req, cb) {
    Groupe.findOne({
      //nom: 'Grand Palace Trio'
      nom: 'Caféine'
    }).exec(function(err, groupe) {
      if (err) return cb(err);
      cb(null, groupe);
    });
  }

};

