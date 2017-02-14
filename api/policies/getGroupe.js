'use strict';
/* jshint unused:false */

module.exports = function(req, res, next) {

  var groupeId = req.params.groupeId;
  if (groupeId && (!req.session.groupe || groupeId != req.session.groupe.id)) {
    Groupe.findOne({
      id: groupeId
    }).exec(function(err, groupe) {
      if (err) sails.error(err);
      else {
        req.session.groupe = groupe;
        sails.log("session.groupe =", groupe);
      }
      next();
    });
  }
  
  else {
    next();
  }
};
