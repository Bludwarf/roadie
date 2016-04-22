# Répète

## Création

En attendant de le faire via l'IHM comme [https://eonasdan.github.io/bootstrap-datetimepicker/].

   - Créer un dossier dans Google Drive, noter son ID
   - Créer la répète en base avec HeidiSQL avec le googleId noté précédemment

## Ajout d'enregistrements

   - Ouvrir http://localhost:1337/ et cliquer sur la répète
   - Cliquer sur l'upload
   - Choisir d'abord le 1er fichier pour vérifier si le token Google n'est pas périmé
   - Si le token est périmé le rafraichir sur http://localhost:1337/google/token puis copier le résultat dans upload.js:getGoogleToken()
   - Sinon uploader tous les autres en même temps

## Upload d'une répète

Pré-requis :

  - On vient de sortir les enregistrements MP3
  - On veut les partager avec les autres membres du groupe

Déroulement :

  - On se connecte à l'appli avec son nom de groupe
  - On crée une répète si elle n'existe pas
    - Il faut indiquer la date/heure de début (la fin est auto par défaut avec la colonne `groupe.duréeRépète`)
    - Cliquer sur OK
  - On upload les fichiers

Traitements :

  - Vérifier le nom du groupe (mot de passe)
  - Crée la répète pour ce groupe
  - On ordonne les fichiers uploadés en fonction de l'ordre d'upload
  - L'idéal serait d'activer une option permettant de choisir si on peut tenir compte du timestamp du fichier
