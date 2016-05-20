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
    fichier: function() {
      if (!this.googleFileId) return null;
      return "https://docs.google.com/uc?export=download&id="+this.googleFileId;
    },

    /** Lien pour écouter directement le mp3 */
    audio: function() {
      return "/enregistrement/"+this.id+".mp3";
    },
    repete: {
      model: 'Repete'
    },
    morceau: {
      model: 'Morceau'
    },

    googleFileId: 'string'
  }
};

