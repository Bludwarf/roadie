# roadie

a [Sails](http://sailsjs.org) application

# Répète

## Création

   - Créer un dossier dans Google Drive, noter son ID
   - Créer la répète en base avec HeidiSQL avec le googleId noté précédemment

## Ajout d'enregistrements

   - Ouvrir http://localhost:1337/ et cliquer sur la répète
   - Cliquer sur l'upload
   - Choisir d'abord le 1er fichier pour vérifier si le token Google n'est pas périmé
   - Si le token est périmé le rafraichir sur http://localhost:1337/google/token puis copier le résultat dans upload.js:getGoogleToken()
   - Sinon uploader tous les autres en même temps
