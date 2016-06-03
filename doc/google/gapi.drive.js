
  gapi.client.load('drive', 'v3').then(function() {
    // Step 5: Assemble the API request
    var request = gapi.client.drive.files.get({
      'fileId': '0B5UYlocMkj-eZHFaV1JnTWNpRDQ'
    });
    // Step 6: Execute the API request
    request.then(function(resp) {
      console.log('resp', resp);
    }, function(reason) {
      console.log('Error: ' + reason.result.error.message);
    });
  });
  
  
  gapi.client.load('drive', 'v2').then(function() {
    // Step 5: Assemble the API request
    var request = gapi.client.drive.files.get({
      'fileId': '0B5UYlocMkj-eZHFaV1JnTWNpRDQ'
    });
    // Step 6: Execute the API request
    request.then(function(resp) {
      console.log('resp', resp);
    }, function(reason) {
      console.log('Error: ' + reason.result.error.message);
    });
  });


  
  fetch('https://www.googleapis.com/drive/v2/files/' + id + '/children', {
    headers: headers
  }).then(function(res) {
    return res.json();
  }).then(function(folder) {
	console.dir(folder);
  });
  