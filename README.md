# Organisation Google Drive

  - Albums
    - On tour
      - À boire.mp3
  - Concerts
    - 20160924 - Goven
      - Setlist.pdf
      - À boire.mp3
  - Morceaux
    - À boire
      - À boire.mp3 (symlink vers Répète X)
      - À boire.mp3 (symlink vers Concert X)
      - À boire.mp3 (symlink vers Album X)
      - À boire.pdf
  - Répètes
    - 20160820 - Rennes
      - À boire.mp3

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
  
## Génération d'une playlist

Pour l'instant deux options sont disponibles pour lire un MP3 depuis une playlist VLC :
  - d'abord lire chaque mp3 dans un navigateur pour mettre en cache le fichier et utiliser le token Google
  - partager le lien de chaque mp3 depuis Google Drive
  
Ensuite il suffit d'ajouter le code XML suivant pour chaque mp3 :

```
<track>
    <location>http://localhost:1337/enregistrement/{id}.mp3?filename={fichier}.mp3</location>
    <title>{fichier}</title>
    <album>Répète 2017-03-13</album>
    <duration>-1</duration>
    <extension application="http://www.videolan.org/vlc/playlist/0">
        <vlc:id>0</vlc:id>
        <vlc:option>network-caching=1000</vlc:option>
    </extension>
</track>
```

Incrémenter le vlc:id et ajouter la ligne suivante :

```
<extension application="http://www.videolan.org/vlc/playlist/0">
    <vlc:item tid="0"/>
    <vlc:item tid="1"/>
    ...
</extension>
```


# Concert

## Préparation d'un concert

On doit pouvoir ressortir rapidement tous les morceaux d'une Set list avec :

  - La structure
  - L'enregistrement choisi parmi tous ceux existant (pour bosser le morceau)
  - Les paroles (si présentes)
  - Le RAF de chaque morceau (avec icône)
    - Structure (au dessus des 5 suivantes)
  - Le RAF de chaque section
    - Accords (clé de sol)
    - Notes
    - Paroles (mégaphone)
    - Interprétation (mf de solfège)
    - Son
  
# Dev

## Installation

### Uniquement la première fois

MySQL : 5.5 minimum

Lancer les scripts SQL :
  - scripts/sql/init-db.sql.
  - api/models/sql/tables.sql
  - api/models/sql/foreign_keys.sql (si ça marche !)
  
Rappel pour lancer un script :

```
mysql roadie --user=roadie -p < fichier
```

Ajouter un groupe dans la table groupe.

Reporter le nom du groupe dans le fichier config/roadie.js. Exemple : 

```
module.exports.roadie = {
  groupe: {
    nom: 'Didaf\'ta'
  }
};
```

### À chaque modif

Installer les dépendances :

```
npm install
bower install

npm install -g pm2
npm install -g pm2-gui
```

Si `npm install` ne termine pas bien => installer tout sauf sails et démarrer quand même l'appli (si sails installé globalement).

Pour démarrer l'appli et la garder tout le temps en vie :

```
pm2 start app.js --name roadie -- --prod
pm2 save
pm2 startup
```

## Lancement de l'appli de prod

    export NODE_ENV=production
    mysql-ctl start
    sails lift
    
Actuellement on doit créer un host sur chaque machine car Google n'autorise pas les token pour des DNS maison.
Fichier host :

```
<ip pour aller vers le serveur> bluberry.bludwarf.fr
```

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