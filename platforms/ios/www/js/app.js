(function() {
  require.config({
    baseUrl: "",
    paths: {
      jquery: "vendor/jquery/jquery.min",
      backbone: "vendor/backbone/backbone-min",
      underscore: "vendor/underscore/underscore-min",
      text: "vendor/text/text",
      app: "js/app",
      tpl: "js/app/tpl"
    },
    shim: {
      backbone: {
        deps: ["underscore", "jquery"],
        exports: "Backbone"
      },
      underscore: {
        exports: "_"
      }
    }
  });

  require(["jquery", "backbone", "app/router"], function($, Backbone, Router) {
    var router;
    router = new Router();
    $("body").on("click", ".back-button", function(event) {
      event.preventDefault();
      return window.history.back();
    });
    return Backbone.history.start();
  });

}).call(this);

/*
//@ sourceMappingURL=app.js.map
*/