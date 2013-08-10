module.exports = (grunt)->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    watch:
      files: ['wwwsrc/coffee/**/*.coffee']
      tasks: 'coffee'
    exec:
      clean:
        command: 'rm -rf www/*'
        stdout: true
        stderr: true
      copy:
        command: 'cp -R wwwsrc/static/* www/'
        stdout: true
        stderr: true
      copy_template:
        command: 'cp -R wwwsrc/coffee/app/tpl/* www/js/app/tpl'
        stdout: true
        stderr: true
      create_template_dir:
        command: 'mkdir www/js/app/tpl'
        stdout: true
        stderr: true
      run:
        command: './cordova/run --target="iPad"'
        stdout: true
        stderr: true
    coffee:
      compile:
        options:
          sourceMap: true
        files: [
            expand: true,
            cwd: 'wwwsrc/coffee/',
            src: ['**/*.coffee'],
            dest: 'www/js/',
            ext: '.js'
        ]

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'compile', ['coffee']
  grunt.registerTask 'clean', ['exec:clean']
  grunt.registerTask 'full_compile', ['exec:clean',"exec:copy",'coffee', 'exec:create_template_dir', 'exec:copy_template']
  return
