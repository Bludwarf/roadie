module.exports = function(grunt) {
  grunt.config.set('bower', {
    dev: {
      dest: '.tmp/public',
      js_dest: '.tmp/public/js',
      css_dest: '.tmp/public/css',

      // Ajout du français pour moment.js
      options: {
        packageSpecific: {
          moment: {
            files: [
              "moment.js",
              "locale/fr.js"
            ]
          }
        }
      }
    }
  });

  grunt.loadNpmTasks('grunt-bower');

};
