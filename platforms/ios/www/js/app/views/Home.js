(function() {
  define(function(require) {
    "use strict";
    var $, Backbone, EmployeeListView, models, template, tpl, _;
    $ = require("jquery");
    _ = require("underscore");
    Backbone = require("backbone");
    EmployeeListView = require("app/views/EmployeeList");
    models = require("app/models/employee");
    tpl = require("text!tpl/Home.html");
    template = _.template(tpl);
    return Backbone.View.extend({
      initialize: function() {
        this.employeeList = new models.EmployeeCollection();
        return this.render();
      },
      render: function() {
        this.$el.html(template());
        this.listView = new EmployeeListView({
          collection: this.employeeList,
          el: $(".scroller", this.el)
        });
        return this;
      },
      events: {
        "keyup .search-key": "search",
        "keypress .search-key": "onkeypress"
      },
      search: function(event) {
        var key;
        key = $(".search-key").val();
        return this.employeeList.fetch({
          reset: true,
          data: {
            name: key
          }
        });
      },
      onkeypress: function(event) {
        if (event.keyCode === 13) {
          return event.preventDefault();
        }
      }
    });
  });

}).call(this);

/*
//@ sourceMappingURL=Home.js.map
*/