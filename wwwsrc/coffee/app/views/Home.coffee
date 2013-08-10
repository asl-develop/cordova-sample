define (require) ->
  "use strict"

  $ = require("jquery")
  _ = require("underscore")
  Backbone = require("backbone")

  EmployeeListView = require("app/views/EmployeeList")
  models = require("app/models/employee")
  tpl = require("text!tpl/Home.html")
  template = _.template(tpl)


  Backbone.View.extend
    initialize: ->
      @employeeList = new models.EmployeeCollection()
      @render()

    render: ->
      @$el.html template()
      @listView = new EmployeeListView(
        collection: @employeeList
        el: $(".scroller", @el)
      )
      @ 

    events:
      "keyup .search-key": "search"
      "keypress .search-key": "onkeypress"

    search: (event) ->
      key = $(".search-key").val()
      @employeeList.fetch
        reset: true
        data:
          name: key


    onkeypress: (event) ->
      # enter key pressed
      event.preventDefault()  if event.keyCode is 13


