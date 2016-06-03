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

# Dev

## Lancement de l'appli de prod

    export NODE_ENV=production
    mysql-ctl start
    sails lift

## Installation de datetimepicker

    bower install eonasdan-bootstrap-datetimepicker#latest --save

## Installation de waterlock-local-auth

Site : [http://waterlock.ninja/documentation/]

La commande de base :

    npm install --save waterlock-local-auth

Si l'erreur suivante apparait :

    MSBUILD : error : MSB3411 : Impossible de charger le composant Visual C++ "VCBuild.exe". Si le composant n'est pas installé, vous devez 1) installer le Kit de développement Microsoft Windows SDK pour Windows Server
    2008 et .NET Framework 2.0 3.5, ou 2) installer Visual Studio 2008.

Installer `Microsoft Visual Studio C++ 2012/13 for Windows Desktop` ([Express][msvc2012] par exemple) (cf [Doc node-gyp][node-gyp]).
Puis indiquer à npm la version de VS utilisée avec ([src][629]) :

	npm config set msvs_version 2015 --global
	
Si le `sails lift` ne marche plus, il faudra peut-être supprimer les modules sails et sails-* puis les réinstaller avec `npm install`.


[msvc2012]: http://go.microsoft.com/?linkid=9816758
[node-gyp]: https://github.com/nodejs/node-gyp/tree/abad2b58c03de713eb1805f7a681b1084c08b316
[629]: https://github.com/nodejs/node-gyp/issues/629#issuecomment-153196245