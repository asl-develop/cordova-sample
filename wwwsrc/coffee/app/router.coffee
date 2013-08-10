define (require) ->
  "use strict"
  $ = require("jquery")
  Backbone = require("backbone")
  HomeView = require("app/views/Home")
  PageSlider  = require('app/utils/pageslider')
  slider = new PageSlider($("body"))
  homeView = new HomeView()



  class Router extends Backbone.Router
    routes:
      "": "home"
      "employees/:id": "employeeDetails"
      "employees/:id/reports": "reports"

    home: ->
      console.log 'works!!'
      homeView.delegateEvents()
      slider.slidePage homeView.$el

    employeeDetails: (id) ->
      require ["app/models/employee", "app/views/Employee"], (models, EmployeeView) ->
        employee = new models.Employee(id: id)
        employee.fetch success: (data) ->
          slider.slidePage new EmployeeView(model: data).$el


    reports: (id) ->
      require ["app/models/employee", "app/views/Reports"], (models, ReportsView) ->
        employee = new models.Employee(id: id)
        employee.fetch success: (data) ->
          slider.slidePage new ReportsView(model: data).$el




