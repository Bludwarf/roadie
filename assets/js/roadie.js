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

sails = {};
sails.config = sails.config || {};
sails.config.google = sails.config.google || {

    // 1 - Obtention d'un code : https://accounts.google.com/o/oauth2/auth?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements&response_type=code&client_id=384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline
    // 2 - Échange d'un code contre un token : https://www.googleapis.com/oauth2/v3/token
    "client_id": "384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com",
    "project_id": "roadie-1238",
    "auth_uri": "https://accounts.google.com/o/oauth2/auth",
    "token_uri": "https://accounts.google.com/o/oauth2/token",
    "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
    "client_secret": "Y4EFeXZozYQyIP0troNs3QMU",

    "apiKey": "AIzaSyCxSmQGKZ9sEr5dfr6RtlRPpvr0_Tls-6w",

    "redirect_path" : "/google/token",

    scopes: 'https://www.googleapis.com/auth/plus.me https://www.googleapis.com/auth/drive'

  };

// https://developers.google.com/api-client-library/javascript/start/start-js#how-it-looks-in-javascript
function googleInit() {
  return googleManualAuth();

  // Step 2: Reference the API key
  console.log('googleInit');
  gapi.client.setApiKey(sails.config.google.apiKey);
  window.setTimeout(checkAuth,1);
}

function googleManualAuth() {
  io.socket.get('/google/token', function(token) {
    gapi.auth.setToken(token);
  });
}

function checkAuth() {
  console.log('checkAuth');
  gapi.auth.authorize({
    client_id: sails.config.google.client_id,
    scope: sails.config.google.scopes,
    immediate: true
  }, handleAuthResult);

  function handleAuthResult(authResult) {
    console.log('handleAuthResult');
    if (authResult && !authResult.error) {
      // auth OK
      //makeApiCall();
    } else {
      console.log(authResult.error, authResult.error);
      function handleAuthClick(event) {
        console.log('handleAuthClick');
        // Step 3: get authorization to use private data
        gapi.auth.authorize({
          client_id: sails.config.google.client_id,
          scope: sails.config.google.scopes,
          immediate: false
        }, handleAuthResult);
        return false;
      }
      handleAuthClick();
    }
  }
}

// Load the API and make an API call.  Display the results on the screen.
//function makeApiCall() {
//  // Step 4: Load the Google+ API
//  gapi.client.load('plus', 'v1').then(function() {
//    // Step 5: Assemble the API request
//    var request = gapi.client.plus.people.get({
//      'userId': 'u/0/+MathieuLavigneBludwarf'
//    });
//    // Step 6: Execute the API request
//    request.then(function(resp) {
//      var heading = document.createElement('h4');
//      var image = document.createElement('img');
//      image.src = resp.result.image.url;
//      heading.appendChild(image);
//      heading.appendChild(document.createTextNode(resp.result.displayName));
//
//      document.getElementById('content').appendChild(heading);
//    }, function(reason) {
//      console.log('Error: ' + reason.result.error.message);
//    });
//  });
//}

function importGoogleFolder(id, cb) {


  gapi.client.load('drive', 'v2').then(function() {
    gapi.client.drive.children.list({ // Step 5: Assemble the API request
      folderId: id
      //fields: [
      //  'items(id,mimeType)'
      //]
    }).then( // Step 6: Execute the API request
      function(res) {
        useFiles(res.result);
      }
    , function(reason) {
      console.log('Error: ' + reason.result.error.message);
    });
  });

  /**
   *
   * @param googleFolder {{etag, items: Array[GoogleFile]}}
   */
  function useFiles(googleFolder) {
    if (googleFolder && googleFolder.items && googleFolder.items.length) {

      /*
       {
       "kind": "drive#childReference",
       "id": "0B5UYlocMkj-eekRfbEZtODJma00",
       "selfLink": "https://www.googleapis.com/drive/v2/files/0B5UYlocMkj-eZHFaV1JnTWNpRDQ/children/0B5UYlocMkj-eekRfbEZtODJma00",
       "childLink": "https://www.googleapis.com/drive/v2/files/0B5UYlocMkj-eekRfbEZtODJma00"
       }
       */

      // Uniquement les MP3
      //var items = _.filter(googleFolder.items, {mimeType: "audio/mpeg"});
      var items = googleFolder.items;

      // Progress
      var progress = document.getElementById("importGoogleFolderProgress");
      progress.value = 0;
      progress.max = items.length;
      progress.style.visibility = 'visible';

      async.eachSeries(items, function iteratee(googleFile, cb) {
        importGoogleFile(googleFile.id, function() {
          ++progress.value;
          cb();
        });
      }, function done() {
        console.log("Fin de l'import du dossier");
        location.reload();
      });
    }
  }
}

/**
 * Ajoute dans la base un lien vers un fichier qui se trouve déjà sur Google Drive
 * (pas besoin de l'uploader)
 *
 * On passe par l'URL : https://www.googleapis.com/drive/v3/files/0B2bkDQNfrAz8UEkydDdEY2xUSEk?key={YOUR_API_KEY}
 *
 * @param id id du fichier dans Google Drive (pour l'obtenir chercher le paramètre id dans l'URL de partage)
 */
// TODO : n'importer que les MP3
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
        googleFileId: googleFile.id,
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
