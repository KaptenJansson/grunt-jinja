#
# grunt-jinja
# https://github.com/matthewwithanm/grunt-jinja
#
# Copyright (c) 2013 Matthew Tretter
# Licensed under the MIT license.
#


module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig

    # Before generating any new files, remove any previously-created files.
    clean:
      tests: ['tmp']

    # Configuration to be run (and then tested).
    jinja:
      simple:
        files:
          'tmp/simple/index.html': 'test/fixtures/simple/index.html'

    # Unit tests.
    nodeunit:
      tests: ['test/*_test.*']

  # Actually load this plugin's task(s).
  grunt.loadTasks 'tasks'

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-nodeunit'

  # Whenever the "test" task is run, first clean the "tmp" dir, then run this
  # plugin's task(s), then test the result.
  grunt.registerTask 'test', ['clean', 'jinja', 'nodeunit']

  # By default, lint and run all tests.
  grunt.registerTask 'default', ['test']
