define (require) ->
  "use strict"
  $ = require("jquery")
  _ = require("underscore")
  Backbone = require("backbone")
  EmployeeListView = require("app/views/EmployeeList")
  tpl = require("text!tpl/Reports.html")
  template = _.template(tpl)
  Backbone.View.extend
    initialize: ->
      @render()

    render: ->
      @$el.html template(@model.attributes)
      @model.reports.fetch()
      @listView = new EmployeeListView(
        collection: @model.reports
        el: $(".scroller", @el)
      )
      @


