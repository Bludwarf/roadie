/**
 * Created by mlavigne on 22/04/2016.
 *
 * Pour tester Google Drive : https://developers.google.com/apis-explorer/#p/drive/v3/
 */

// langue pour moment.js
//moment.locale("fr");

// new.ejs
/*
 $(function () {
 $('#datetimepicker').datetimepicker({
 locale: 'fr',
 inline: true,
 sideBySide: true
 });
 });
 */


function importGoogleFolder(id, cb) {

  var keyId = "AIzaSyCxSmQGKZ9sEr5dfr6RtlRPpvr0_Tls-6w";
  var fields = [
    'id',
    'name',
    'modifiedTime'
  ];
  var headers = new Headers();
  headers.append("Authorization", "Bearer " + getGoogleToken());

  /**
   *
   * @param googleFolder {{etag, items: Array[GoogleFile]}}
   */
  function useFiles(googleFolder) {

    /*
     items
     :
     Array[12]
     0
     :
     Object
     childLink
     :
     "https://www.googleapis.com/drive/v2/files/0B5UYlocMkj-eekRfbEZtODJma00"
     id
     :
     "0B5UYlocMkj-eekRfbEZtODJma00"
     kind
     :
     "drive#childReference"
     selfLink
     :
     "https://www.googleapis.com/drive/v2/files/0B5UYlocMkj-eZHFaV1JnTWNpRDQ/children/0B5UYlocMkj-eekRfbEZtODJma00"
     */
    console.dir(googleFolder);
    if (googleFolder && googleFolder.items && googleFolder.items.length) {
      googleFolder.items.forEach(function(googleFile) {
        importGoogleFile(googleFile.id, function(err, sqlFile) {
          if (err) return console.error(err);
          console.dir(sqlFile);
        });
      });
    }
  }

  fetch('https://www.googleapis.com/drive/v2/files/' + id + '/children', {
    headers: headers
  }).then(function(res) {
    return res.json();
  }).then(useFiles);
}

/**
 * Ajoute dans la base un lien vers un fichier qui se trouve déjà sur Google Drive
 * (pas besoin de l'uploader)
 *
 * On passe par l'URL : https://www.googleapis.com/drive/v3/files/0B2bkDQNfrAz8UEkydDdEY2xUSEk?key={YOUR_API_KEY}
 *
 * @param id id du fichier dans Google Drive (pour l'obtenir chercher le paramètre id dans l'URL de partage)
 */
function importGoogleFile(id, cb) {

  var keyId = "AIzaSyCxSmQGKZ9sEr5dfr6RtlRPpvr0_Tls-6w";
  var headers = new Headers();
  headers.append("Authorization", "Bearer " + getGoogleToken());

  var fields = [
    'id',
    'name',
    'modifiedTime'
  ];

//    var url = new URL("https://www.googleapis.com/drive/v3/files/" + googleFileId);
//    if (!URL.prototype.searchParams) {
//
//      // URLSearchParams >= 49 pour Chrome
//      if (typeof URLSearchParams === 'undefined') {
//        var URLSearchParams = function() {
//          this.params = {};
//        }
//
//        URLSearchParams.prototype.append = function(key, value) {
//          this.params[key] = value;
//        }
//
//        window.URLSearchParams = URLSearchParams;
//      }
//
//      URL.prototype.searchParams = new URLSearchParams();
//    }
//    url.searchParams.append();

  // https://fetch.spec.whatwg.org/#fetch-method
  fetch('https://www.googleapis.com/drive/v3/files/' + id + '?fields=' + encodeURIComponent(fields.join(',')) + '&key=' + keyId, {
    headers: headers
  }).then(function(res) {
    return res.json();
  }).then(
    /**
     * @type {{
           kind: "drive#file",
           id: "0B2bkDQNfrAz8UEkydDdEY2xUSEk",
           name: "Downtown.mp3",
           mimeType: "audio/mpeg",
           modifiedTime: "2016-03-17T13:46:06.308Z"
         }}
     */
    function(googleFile) {

      /** @type {{
        nom: string,
        timestamp: date,
        fichier:  'https://docs.google.com/uc?export=download&id={googleFile.id}',
        audio: 'https://drive.google.com/open?id={googleFile.id}',
        duree: Number,
        repete: Number
      }} */
      var sql = {
        nom: googleFile.name,
        timestamp: googleFile.modifiedTime,
        fichier: 'https://docs.google.com/uc?export=download&id=' + googleFile.id,
        audio: 'https://drive.google.com/open?id=' + googleFile.id,
        // duree: TODO,
        repete: repeteId
      };

      io.socket.post('/api/enregistrement', sql, function(enrSql, jwr) {
        if (jwr.error) {
          if (cb) return cb(jwr.error);
          if (jwr.error.message) return alert("Erreur SQL : " + jwr.error.message);
          return alert('Erreur SQL HTTP ' + jwr.statusCode + ' reçue de Google');
        }
        console.dir(enrSql);
        if (cb) return cb(null, enrSql);
        location.reload(); // TODO : callback
      });
    });
}
