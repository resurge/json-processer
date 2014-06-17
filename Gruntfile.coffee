module.exports = (grunt) ->
  grunt.initConfig
    watch:
      config:
        files: ['Gruntfile.coffee']
        options:
          reload: true
      coffee:
        files: ['./src/coffee/**.coffee']
        tasks: ['coffee']
      livereload:
        files: [
          "./src/**.html"
          "./src/css/**.css"
          "./src/js/**.js"
        ]
        options:
          livereload: true
    coffee:
      compile:
        files: [
          expand: true
          cwd: './src/coffee'
          src: ['**.coffee']
          dest: "./src/js"
          ext: '.js'
        ]
    connect:
      server:
        options:
          base: "./src"
          port: 8081
    copy:
      ghpages:
        files: [
          expand: true
          cwd: 'src'
          src: ['**.html', 'js/**.js', 'css/**.css']
          dest: "./gh-pages"
        ]

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'

  grunt.registerTask 'default', ['coffee', 'connect', 'watch']
  grunt.registerTask 'deploy', ['coffee', 'copy:ghpages'] #todo: push branch