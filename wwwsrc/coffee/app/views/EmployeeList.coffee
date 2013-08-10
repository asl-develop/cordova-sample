define (require) ->
  "use strict"
  $ = require("jquery")
  _ = require("underscore")
  Backbone = require("backbone")
  tpl = require("text!tpl/EmployeeList.html")
  template = _.template(tpl)
  Backbone.View.extend
    initialize: ->
      @render()
      @collection.on "reset", @render, @

    render: ->
      @$el.html template(employees: @collection.toJSON())
      @


