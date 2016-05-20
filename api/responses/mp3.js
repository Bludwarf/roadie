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
var async = require('async');

module.exports = function mp3(file) {

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

    /**
     *
     * @param stats {{mtime}}
     * @param cb
     */
    function readFile(stats, cb) {
      fs.readFile(file, function(e, data) {
        if (e) return cb(e);
        return cb(null, stats, data);
      });
    }

  ], function(err, stats, data) {
    if (err) return res.serverError(err);
    res.writeHead(206, {
      'Accept-Ranges': 'bytes', // src : http://stackoverflow.com/questions/14304642/transcoding-and-streaming-audio-how-to-send-content-range-headers
      'Content-Length': data.length,
      'Content-Range': 'bytes 0-'+(data.length-1)+'/'+data.length, // TODO : prendre en compte le Range demandé par le client
      'Content-Type': 'audio/mpeg',
      'Last-Modified': new Date(stats.mtime) // exemple "Mon, 10 Jan 2011 18:23:27 GMT"
    });
    res.end(data, 'binary');
  });

};
