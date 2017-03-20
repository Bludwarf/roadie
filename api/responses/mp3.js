/**
 * 200 (OK) Response
 *
 * Usage:
 * return res.ok();
 * return res.ok(data);
 * return res.ok(data, 'auth/login');
 *
 * @param  {Object} data
 * @param  {String|Object} options
 *          - pass string to render specified view
 */
var fs = require('fs');
var path = require('path');
var async = require('async');

/**
 * si on ajoute le paramètre filename alors le lien vers le mp3 devient un lien téléchargeable
 */
module.exports = function mp3(file, filename) {

  // Get access to `req`, `res`, & `sails`
  var req = this.req;
  var res = this.res;
  var sails = req._sails;

  async.waterfall([

    function access(cb) {
      fs.access(file, fs.R_OK, function(err) {
        if (err) return cb(err);
        cb(null);
      });
    },

    function stat(cb) {
      fs.stat(file, cb);
    },
    
    function range(stats, cb) {
      // Prise en compte du Content-Range client
      // exemple début VLC : 'bytes=0-'
      // exemple milieu VLC : 'bytes=1536274-'
      var range = {start: 0, end: stats.size-1, length: stats.size};
      if (req.headers.range) {
        var rx = /bytes=(\d*)-(\d*)/i;
        var rs = rx.exec(req.headers.range);
        range.start = parseInt(rs[1]) || 0;
        range.end = parseInt(rs[2]) || stats.size-1;
        range.length = range.end - range.start + 1;
      }
      cb(null, stats, range);
    },

    /**
     *
     * @param stats {{mtime}}
     * @param cb
     */
    function readFile(stats, range, cb) {
      
      cb(null, stats, range, fs.createReadStream(file, {
        start: range.start,
        end: range.end
      }));
      
      /*fs.readFile(file, function(e, data) {
        if (e) return cb(e);
        return cb(null, stats, range, data);
      });*/
    }

  ], function(err, stats, range, stream) {
    if (err) return res.serverError(err);
    
    var headers = {
      'Accept-Ranges': 'bytes', // src : http://stackoverflow.com/questions/14304642/transcoding-and-streaming-audio-how-to-send-content-range-headers
      'Connection': 'keep-alive',
      'Content-Length': range.length,
      'Content-Range': 'bytes '+range.start+'-'+range.end+'/'+range.length,
      'Content-Type': 'audio/mpeg',
      'Last-Modified': new Date(stats.mtime) // exemple "Mon, 10 Jan 2011 18:23:27 GMT"
    };
    
    if (filename) {
      headers['Content-Disposition'] = 'attachment; filename="'+filename+'.mp3"';
    }
    res.writeHead(206, headers);
    stream.pipe(res); // http://stackoverflow.com/a/36729528/1655155
  });

};
