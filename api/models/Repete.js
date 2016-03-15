/**
* Repete.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/


var moment = require('moment');
moment.locale('fr');

module.exports = {

  attributes: {
    debut: {
      type: 'datetime'
    },
    fin: {
      type: 'datetime'
    },
    notes: {
      type: 'string'
    },
    groupe: {
      model: 'Groupe'
    },
    local: {
      model: 'Local'
    },

    enregistrements: {
      collection: 'Enregistrement',
      via: 'repete'
    },

    next: function(cb) {

    },

    debutToString: function() {
      return moment(this.debut).format("ddd D MMMM YYYY");
    }
  }
};

