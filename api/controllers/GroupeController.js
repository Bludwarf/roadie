/**
 * GroupeController
 *
 * @description :: Server-side logic for managing groupes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

module.exports = {
    
  index: function(req, res) {
    this.getCurrent(req, function(err, groupe) {
      if (err) return res.serverError(err);
      if (!groupe) return res.notFound();
      return res.redirect('/groupe/'+groupe.id+'/repetes');
    });
  },

  // TODO : groupe de l'utilisateur actuellement connecté
  getCurrent: function(req, cb) {
    Groupe.findOne({
      nom: sails.config.roadie.groupe.nom
    }).exec(function(err, groupe) {
      if (err) return cb(err);
      sails.log("groupe", groupe);
      cb(null, groupe);
    });
  },
  
  get: function(req, cb) {
    sails.log("groupeId", req.params.groupeId);
    return cb();
  }

};

