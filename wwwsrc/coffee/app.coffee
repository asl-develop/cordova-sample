

require.config

  baseUrl: ""
  paths:
    jquery: "vendor/jquery/jquery.min"
    backbone: "vendor/backbone/backbone-min"
    underscore: "vendor/underscore/underscore-min"
    text: "vendor/text/text"
    app: "js/app"
    tpl: "js/app/tpl"

    #  map:
    #"*":
    #  "app/models/employee": "app/models/memory/employee"

  shim:
    backbone:
      deps: ["underscore", "jquery"]
      exports: "Backbone"

    underscore:
      exports: "_"

require ["jquery", "backbone", "app/router"], ($, Backbone, Router) ->
  router = new Router()
  $("body").on "click", ".back-button", (event) ->
    event.preventDefault()
    window.history.back()

  Backbone.history.start()

