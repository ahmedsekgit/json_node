==============================
Automatically Restart Node For Application Changes With Grunt   
==============================
npm install grunt  --save-dev
npm install -g browser-sync
npm install -g grunt-cli
sudo apt install node-grunt-cli
npm install grunt --save-dev
npm install grunt-contrib-watch --save-dev
npm install grunt-contrib-connect --save-dev

npm install grunt-nodemon  - -save-dev
In your NodeJs project root you need to create gruntfile.js which is basically acts as configuration file for grunt.
in the same folder where app.js is
You can enter grunt file content as following.
module.exports = function(grunt) {
  grunt.initConfig({
    nodemon: {
      all: {
        script: 'app.js',
        options: {
          watchedExtensions: ['js']
        }
      }
    }
  });
  grunt.loadNpmTasks('grunt-nodemon');
  grunt.registerTask('default', 'nodemon');
};
Your application entry point Js file should be included for node mon’s “script” config property value in my case which was “app.js”.
 Once you have done this all you have to do is just type “grunt” in you terminal.
You can enter “rs” to restart node at any time if you change a server side non public js file
 you would see nodemon is restarting the node server avoiding you to do it manually 
and avoiding the annoyance as you would see in terminal window.
  
==============================
83 at  2021-10-29T15:22:52.000Z
==============================
