(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  define(function(require) {
    "use strict";
    var $, Backbone, HomeView, PageSlider, Router, homeView, slider, _ref;
    $ = require("jquery");
    Backbone = require("backbone");
    HomeView = require("app/views/Home");
    PageSlider = require('app/utils/pageslider');
    slider = new PageSlider($("body"));
    homeView = new HomeView();
    return Router = (function(_super) {
      __extends(Router, _super);

      function Router() {
        _ref = Router.__super__.constructor.apply(this, arguments);
        return _ref;
      }

      Router.prototype.routes = {
        "": "home",
        "employees/:id": "employeeDetails",
        "employees/:id/reports": "reports"
      };

      Router.prototype.home = function() {
        console.log('works!!');
        homeView.delegateEvents();
        return slider.slidePage(homeView.$el);
      };

      Router.prototype.employeeDetails = function(id) {
        return require(["app/models/employee", "app/views/Employee"], function(models, EmployeeView) {
          var employee;
          employee = new models.Employee({
            id: id
          });
          return employee.fetch({
            success: function(data) {
              return slider.slidePage(new EmployeeView({
                model: data
              }).$el);
            }
          });
        });
      };

      Router.prototype.reports = function(id) {
        return require(["app/models/employee", "app/views/Reports"], function(models, ReportsView) {
          var employee;
          employee = new models.Employee({
            id: id
          });
          return employee.fetch({
            success: function(data) {
              return slider.slidePage(new ReportsView({
                model: data
              }).$el);
            }
          });
        });
      };

      return Router;

    })(Backbone.Router);
  });

}).call(this);

/*
//@ sourceMappingURL=router.js.map
*/