/**
 * Created by mlavigne on 03/03/2016.
 *
 * Pour tester : https://developers.google.com/apis-explorer/#p/drive/v3/
 * Config pour l'appli roadie-1238 : https://console.developers.google.com/apis/credentials?project=roadie-1238
 */

// repeteId
//Object.defineProperty(this, 'repeteId', {
//  get: function() {
//    return getRepeteId();
//  }
//});

function getRepeteId() {
  var getRepeteId = /\/repete\/(\d+)\/?/; // on récup l'id de la répète dans l'URL
  var matches = getRepeteId.exec(location.pathname);
  return parseInt(matches[1]);
}

/**
 *
 * @param cb {function(e, token)}
 * @returns {string}
 */
function getGoogleToken(cb) {
  // Pour le changer, visiter : /google/token
  var token = {
    access_token: "ya29..ywKGxCn6DcsaPcwoaoALUDlRSNJv8GS1MhRhYk0dvJuGEKXKUxnyZnLYhneZHqPX1mFO",
    token_type: "Bearer",
    expires_in: 3600,
    expires_at: "2016-04-21T17:53:08.978Z"
  };

  if (new Date() >= new Date(token.expires_at)) {
    throw new Error("Token Google expiré. Pour le changer visiter : /google/token");
  }

  return token.access_token;
}


// Pour envoyer du multipart/related
function RelatedFormData() {

}

/**
 *
 * @param content ArrayBuffer, exemple FileReader.readAsArrayBuffer(file);
 * @param mimetype
 * @returns {ArrayBuffer}
 * @author http://stackoverflow.com/questions/8262266/xmlhttprequest-multipart-related-post-with-xml-and-image-as-payload
 */
RelatedFormData.prototype.gen_multipart = function(metadata, content, mimetype) {
  content = new Uint8Array(content); // Wrap in view to get data

  var before = [
    /*'Media multipart posting',
     "   \n",*/
    '--END_OF_PART\n',
    'Content-Type: application/json; charset=UTF-8\n',
    '\n', // ligne vide
    JSON.stringify(metadata),
    '\n',
    '--END_OF_PART\n',

    'Content-Type:',
    mimetype,
    "\n\n"
  ].join('');
  var after = '\n--END_OF_PART--';
  var size = before.length + content.byteLength + after.length;
  var uint8array = new Uint8Array(size);
  var i = 0;

  // Append the string.
  for (; i<before.length; i++) {
    uint8array[i] = before.charCodeAt(i) & 0xff;
  }

  // Append the binary data.
  for (var j=0; j<content.byteLength; i++, j++) {
    uint8array[i] = content[j];
  }

  // Append the remaining string
  for (var j=0; j<after.length; i++, j++) {
    uint8array[i] = after.charCodeAt(j) & 0xff;
  }
  return uint8array; // <-- This is an ArrayBuffer object!
};






function createGoogleFile(metadata) {
  var req = new XMLHttpRequest();
  req.open("POST", "https://www.googleapis.com/drive/v3/files");
  req.setRequestHeader("Authorization", "Bearer " + getGoogleToken());
  req.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  req.send(JSON.stringify(metadata));
  return req;
}

function updateGoogleFile(metadata) {
  var req = new XMLHttpRequest();
  req.open("PATCH", "https://www.googleapis.com/drive/v3/files/" + metadata.id);
  req.setRequestHeader("Authorization", "Bearer " + getGoogleToken());
  req.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
  req.send(JSON.stringify(metadata));
  return req;
}

// doc : https://developers.google.com/drive/v3/web/manage-uploads
function uploadGoogleFile(file) {
  var req = new XMLHttpRequest();

  var url = "https://www.googleapis.com/upload/drive/v3/files";
  req.open('POST', url + "?uploadType=media");

  // Headers
  req.setRequestHeader("Authorization", "Bearer " + getGoogleToken());
  req.setRequestHeader("Content-Type", file.type);

  req.upload.addEventListener('progress', function(e) {
    progress.value = e.loaded;
    progress.max = e.total;
  });

  req.addEventListener('load', function() {
    console.log('Upload terminé !');
  });

//    // upload d'un formulaire XHR
//    var xhrForm = new FormData();
//    xhrForm.append('file', file);
//    req.send(xhrForm);

  // upload du fichier uniquement
  req.send(file);

  return req;
}

/**
 * @param cb {function} : appelé uniquement en cas de succès
 */
function createAndUploadGoogleFile(file, repeteId, cb) {

  // ui_elements
  var progress = file.ui_elements.progress;

  var reader = new FileReader();

  reader.onload = function(event) {
    if (reader.readyState === FileReader.DONE) {

      // Buffer => terminé direct mais pas encore lu
      var form = new RelatedFormData();

      var req = new XMLHttpRequest();

      // https://developers.google.com/drive/v3/web/manage-uploads#multipart
      var url = "https://www.googleapis.com/upload/drive/v3/files";
      req.open('POST', url + "?uploadType=multipart");

      // Headers
      req.setRequestHeader("Authorization", "Bearer " + getGoogleToken());
      req.setRequestHeader("GData-Version", '3.0');
      req.setRequestHeader("Content-Type",  'multipart/related; boundary="END_OF_PART"');
      req.setRequestHeader("MIME-version", "1.0");

      // xhr.setRequestHeader("Authorization", oauth.getAuthorizationHeader(url, method, '')); // http://stackoverflow.com/q/8262266/1655155

      req.upload.addEventListener('progress', function(e) {
        progress.value = e.loaded;
        progress.max = e.total;
      });

      req.addEventListener('load', function() {
        progress.value = progress.max;

        // OK ?
        var item = $(file.ui_elements.li);
        if (this.status == 200) {
          item.addClass("list-group-item-success"); // pas encore OK, il reste le SQL mais on indique déjà que la partie Google est OK
          console.log(file.name + ' : Upload terminé !');
          return cb(null, JSON.parse(this.responseText));
        }

        else {
          item.addClass("list-group-item-danger");
          alert("Erreur " + this.status + " : " + this.responseText);
        }
      });

      req.addEventListener('error', function(e) {
        progress.value = progress.max;
        $(file.ui_elements.li).addClass("list-group-item-danger");
        console.log(file.name + ' : Upload KO');
      });
      req.addEventListener('abort', function(e) {
        progress.value = progress.max;
        $(file.ui_elements.li).addClass("list-group-item-warning");
        console.log(file.name + ' : Upload KO');
      });

//    // upload d'un formulaire XHR
//    var xhrForm = new FormData();
//    xhrForm.append('file', file);
//    req.send(xhrForm);

      // https://developers.google.com/drive/v3/reference/files#resource-representations
      var metadata = {
        createdTime: file.lastModifiedDate.toISOString(), // conservation du timestamp
        modifiedTime: file.lastModifiedDate.toISOString(), // conservation du timestamp
        mimeType: file.type,
        name: file.name,
		    description: 'Enregistrement pendant la répète #' + repeteId
      };

      // Dossier ?
      window.gDirId = window.gDirId || prompt("ID du dossier Google Drive");
      if (window.gDirId) {
        metadata.parents = [window.gDirId];
      }

      var fileBuffer = this.result;
//        form.onprogress = function(e) {
//          progress.value = e.loaded;
//          progress.max = e.total;
//        }
      req.send(form.gen_multipart(metadata, fileBuffer, file.type)); // FIXME: l'encodage est mal géré pour le nom du fichier : Buffer ?

      return req;

    }
  };

  reader.readAsArrayBuffer(file);
//    reader.readAsText(fileInput.files[0]);
}

/**
 *
 * @param file
 * @param uploadResults parent de l'élément qui affichera la progression de l'upload, peut-être directement un XPath CSS comme jQuery)
 * @returns {{li, name, progress}}
 */
function ui_startUpload(file, uploadResults) {
  //var template = $("#upload-template");
  //var li = template.clone();

  var li = $('<li class="list-group-item"><span class="mp3">'+file.name+'</span><progress style="margin-bottom: 0; margin-left: 1em; vertical-align: middle;" value="0" max="'+file.size+'"></progress></li>');
  var elements = {
    li: li
  };

  // nom du fichier
  $(".mp3", li).each(function() {
    elements.name = this;
  });

  // progress bar
  $("progress", li).each(function() {
    elements.progress = this;
  });

  // Ajout dans l'IHM
  li.appendTo(uploadResults);

  return elements;
}

function detectUpload(fileInput, uploadResults) {

  // On réinitialise l'input au cas où on retenterait le même fichier (dont pas de "change")
  fileInput.onclick = function(e) {
    fileInput.form.reset();
  };

  fileInput.addEventListener('change', function() {
    var form = document.forms.upload;
    //console.dir(fileInput.files);

    if (fileInput.files) {
      for(var i = 0; i < fileInput.files.length; ++i) {
        /**
         * Doc: https://developer.mozilla.org/en-US/docs/Web/API/File
         {
           lastModified: 1293837266000
           lastModifiedDate: Sat Jan 01 2011 00:14:26 GMT+0100 (Paris, Madrid)
           name: "bee.MP3"
           size: 7574674
           type: "audio/mp3"
           webkitRelativePath: ""
         }
         */
        var file = fileInput.files[i];

        // Start dans l'IHM
        file.ui_elements = ui_startUpload(file, uploadResults);

        // Upload
        (function(file) { // unmutable

          createAndUploadGoogleFile(file, getRepeteId(), function ok(err, googleFile) {

            /*
             lastModified: 1293837266000
             lastModifiedDate: Sat Jan 01 2011 00:14:26 GMT+0100 (Paris, Madrid)
             name: "bee.MP3"
             size: 7574674
             type: "audio/mp3"
             webkitRelativePath: ""
             */

            // On peut maintenant ajouter l'enregistrement en base

            var sql = {
              nom: file.name,
              timestamp: file.lastModifiedDate.toISOString(),
              fichier:  'https://docs.google.com/uc?export=download&id=' + googleFile.id,
              audio: 'https://drive.google.com/open?id=' + googleFile.id,
              // duree: ,
              repete: getRepeteId()
              // morceau
            };

            //if (file.size != 'undefined') sql.taille = parseInt(file.size); // FIXME: parseInt ne marche pas ?
            io.socket.post('/enregistrement', sql, function(enrSql, jwRes) {

              console.dir(jwRes);
              console.dir(file.name);
              var item = $(file.ui_elements.li);

              // On intègre l'item dans la liste des fichiers déjà existants
              // Doit être pareil que repete/show.ejs
              item.replaceWith(
                [
                  '<li class="list-group-item list-group-item-warning">', // on ajoute le style "warning" car juste après l'upload le morceau est inconnu
                  '<a href="/enregistrement/' + enrSql.id + '/set-morceau?from=' + location.pathname + '" title="Lier à un morceau"><span class="label label-warning">Morceau inconnu</span></a>',
                  '<a href="' + enrSql.audio + '">' + file.name + '</a>', // lien vers l'audio : {enr.audio}
                  '</li>'
                ].join('\n'));
            });

          });

        })(file);

        //    // Création du fichier vide dans Google Drive (sans contenu)
        //    console.log("Création du fichier vide %s dans Google Drive...", file.name);
        //    var req = createGoogleFile({
        //      createdTime: file.lastModifiedDate.toISOString(),
        //      mimeType: file.type,
        //      name: file.name
        //    });
        //    req.onreadystatechange = function(e) {
        //      if (this.readyState == 4) {
        //        if (this.status == 200) {
        //          var newFile = JSON.parse(this.responseText);
        //          console.log("Fichier vide %s créé dans Google Drive :", newFile.id);
        //          console.dir(newFile);
        //
        //
        //        }
        //
        //        else {
        //          // En cas d'erreur appeler l'URL : https://accounts.google.com/o/oauth2/auth?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements&response_type=code&client_id=384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline
        //          // récupérer le paramètre code dans l'URL suivie
        //          // demander un token avec POSTMAN sur l'URL : https://www.googleapis.com/oauth2/v3/token
        //          alert('Erreur lors de la création du fichier dans Google Drive : ' + this.responseText);
        //        }
        //      }
        //    };


        // Upload du fichier
//        console.log("Upload du fichier %s dans Google Drive...", file.name);
//        var req = uploadGoogleFile(file, newFile);
//        req.onreadystatechange = function(e) {
//          if (this.readyState == 4) {
//            if (this.status == 200) {
//
//              // Fichier uploadé avec succès
//              console.log('Fichier uploadé avec succès');
//
//              /**
//               {
//				 "kind": "drive#file",
//				 "id": "0B5UYlocMkj-eV042cldDcUxhM1E",
//				 "name": "Untitled",
//				 "mimeType": "audio/mpeg"
//				 }
//               */
//              var createdFile = JSON.parse(this.responseText);
//              console.dir(createdFile);
//
//              // TODO : on peut faire un check entre la taille du fichier envoyé et celui uploadé dans Google Drive (doit être parfaitement égal)
//
//              // Création du fichier vide dans Google Drive (sans contenu)
//              console.log("Création du fichier vide %s dans Google Drive...", file.name);
//              var req = updateGoogleFile({
//                createdTime: file.lastModifiedDate.toISOString(),
//                mimeType: file.type,
//                name: file.name
//              });
//              req.onreadystatechange = function(e) {
//                if (this.readyState == 4) {
//                  if (this.status == 200) {
//                    var newFile = JSON.parse(this.responseText);
//                    console.log("Fichier vide %s créé dans Google Drive :", newFile.id);
//                    console.dir(newFile);
//
//
//                  }
//
//                  else {
//                    // En cas d'erreur appeler l'URL : https://accounts.google.com/o/oauth2/auth?redirect_uri=http://localhost:1337/repete/1/upload-enregistrements&response_type=code&client_id=384973764394-kkgm56vp45i0s7ao7ikt4jodgb95cq8a.apps.googleusercontent.com&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fdrive&access_type=offline
//                    // récupérer le paramètre code dans l'URL suivie
//                    // demander un token avec POSTMAN sur l'URL : https://www.googleapis.com/oauth2/v3/token
//                    alert('Erreur lors de la création du fichier dans Google Drive : ' + this.responseText);
//                  }
//                }
//              };
//            }
//
//            else
//              alert("Erreur pendant le chargement de la page.\n");
//          }
//        }; // req.onreadystatechange

      }; // for file
    }//if

  });
}
