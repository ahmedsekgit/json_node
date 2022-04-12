/*
module.exports = function(grunt) {
  grunt.initConfig({
    nodemon: {
      all: {
        script: 'app.js',
        options: {
          watchedExtensions: ['js'],
          env: {
                PORT: '3000'
                }
        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-nodemon');
  grunt.registerTask('default', 'nodemon');
};
*/
module.exports = function(grunt) {
        grunt.initConfig({
            //watches for the specified files and executes the task associated to be performed
            watch: {
                refresh: {
                    options: {
                        livereload: '<%= connect.options.livereload %>'
                    },
                    files: ['app/**/*.js', 'app/**/*.css', 'app/**/*.html'] //give the list of all files that you want to watch for and reload
                }
            },
            //serves the application under this configuration
            connect: {
                options: {
                    port: 9000,
                    // Change this to '0.0.0.0' to access the server from outside.
                    hostname: 'localhost',
                    livereload: 35729
                },
                livereload: {
                    options: {
                        open: true,
                    }
                }
            }
        });
        //load all Npm tasks
        grunt.loadNpmTasks('grunt-contrib-watch');
        grunt.loadNpmTasks('grunt-contrib-connect');

        //register tasks to be run
        grunt.registerTask('serve', ['connect:livereload', 'watch']);