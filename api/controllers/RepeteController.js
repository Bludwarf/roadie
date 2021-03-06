/**
 * RepeteController
 *
 * @description :: Server-side logic for managing repetes
 * @help        :: See http://sailsjs.org/#!/documentation/concepts/Controllers
 */

var _ = require('lodash');
var async = require('async');
var GroupeController = require('./GroupeController');

module.exports = {
  list: function(req, res) {

    async.auto({
    
      // find groupe
      groupe: function(cb) {
        if (req.params.groupeId) {
          Groupe.findOne({
            id: req.params.groupeId
          }).exec(cb);
        }
        else {
          GroupeController.getCurrent(req, cb);
        }
      },
      
      // find répète
      repetes: ['groupe', function(cb, results) {
        var groupe = results.groupe;
        Repete.find({
          groupe: groupe.id
        }).sort('debut DESC')
          .populate('enregistrements')
          .exec(cb);
      }]
    }, function(err, results) {
      if (err) return res.serverError(err);
      res.view({
        groupe: results.groupe,
        repetes: results.repetes
      });
    });

  },

  show: function(req, res) {

    Repete
      .findOne(req.params.id)
      .populate('local')
      .populate('enregistrements', {
        sort: {
          ordre: 1,
          timestamp: 1,
          nom: 1
        }
      })

      // populate enregistrements.morceau : http://stackoverflow.com/a/26452990/1655155
      .then(function(repete) {
        return [
          repete,
          Morceau
            .find({
              id: _.pluck(repete.enregistrements, 'morceau') //_.pluck: Retrieves the value of a 'user' property from all elements in the post.comments collection.
            })
            .then(function(morceaux) {
              return morceaux;
            })
        ]
      })
      .spread(function(repete, morceaux) {
        morceaux = _.indexBy(morceaux, 'id');

        //_.indexBy: Creates an object composed of keys generated from the results of running each element of the collection through the given callback. The corresponding value of each key is the last element responsible for generating the key
        if (repete.enregistrements) {
          repete.enregistrements = _.map(repete.enregistrements, function(enregistrement) {
            enregistrement.morceau = morceaux[enregistrement.morceau];
            return enregistrement;
          });
        }

        res.view({
          repete: repete
        });
      })

      .catch(function(err) {
        return res.serverError(err);
      });
  },

  uploadEnregistrements: function(req, res) {

    // TODO : nécessaire de chopper la répète alors qu'on veut juste uploader ?
    Repete
      .findOne(req.params.id)
      .then(function(repete) {
        res.view({
          repete: repete
        });
      })
      .catch(function(err) {
        return res.serverError(err);
      });

  },

  /**
   * Formulaire pour créer une répète
   * @param req
   * @param res
   */
  new: function(req, res) {
    res.view();
  },
  
  create: function (req, res) {
    Repete.create(req.body).exec(function (err, result) {
      if (err) return res.serverError(err);
      return res.redirect('/repete/'+result.id);
    });
  }

};

