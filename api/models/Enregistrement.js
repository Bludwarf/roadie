/**
* Enregistrement.js
*
* @description :: TODO: You might write a short summary of how this model works and what it represents here.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

module.exports = {

  attributes: {

    /** nom du fichier */
    nom: {
      type: 'string',
      required: true
    },

    timestamp: {
      type: 'datetime'
    },
    taille: {
      type: 'number'
    },

    /** lien pour télécharger */
    fichier: {
      type: 'string'
    },

    /** lien pour écouter */
    audio: {
      type: 'string'
    },
    repete: {
      model: 'Repete'
    },
    morceau: {
      model: 'Morceau'
    }
  }
};

