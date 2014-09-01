gulp        = require 'gulp'
jade        = require 'gulp-jade'
sass        = require 'gulp-ruby-sass'
rename      = require 'gulp-rename'
plumber     = require 'gulp-plumber'
coffee      = require 'gulp-coffee'
coffeelint  = require 'gulp-coffeelint'
sync        = require 'browser-sync'
bowerFiles  = require 'main-bower-files'
concat      = require 'gulp-concat'
uglify      = require 'gulp-uglify'

# static server
gulp.task 'server', ->
  sync
    server:
      baseDir: './build'

# reload
gulp.task 'reload', ->
  sync.reload()

# sass
gulp.task 'sass', ->
  gulp
    .src 'src/scss/*.scss'
    .pipe plumber()
    .pipe sass()
    .pipe gulp.dest './build/css'

# coffee
gulp.task 'coffee', ->
  gulp
    .src 'src/coffee/*.coffee'
    .pipe coffeelint()
    .pipe coffeelint.reporter()
    .pipe coffee()
    .pipe uglify()
    .pipe gulp.dest './build/js'

# jade
gulp.task 'jade', ->
  gulp
    .src 'src/jade/*.jade'
    .pipe jade()
    .pipe gulp.dest './build'

# vendor
gulp.task 'vendor', ->
  gulp
    .src bowerFiles()
    .pipe plumber()
    .pipe concat 'vendor.js'
    .pipe uglify()
    .pipe gulp.dest './build/js'

# watch
gulp.task 'watch', ['build', 'server'], ->

  gulp.watch 'src/**/*.scss', ['sass']
  gulp.watch 'src/**/*.coffee', ['coffee']
  gulp.watch 'src/**/*.jade', ['jade']
  gulp.watch 'bower_components/**/*.js', ['vendor']

  # reload
  gulp.watch 'build/*.html', ['reload']
  gulp.watch 'build/**/*.css', ['reload']
  gulp.watch 'build/**/*.js', ['reload']

# default
gulp.task 'build', ['vendor', 'coffee', 'sass', 'jade']
gulp.task 'default', ['build']