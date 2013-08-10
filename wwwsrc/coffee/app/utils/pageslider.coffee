define (require) ->
  "use strict"
  $ = require("jquery")
  class PageSlider 

    constructor: (@container) ->
      @currentPage = undefined
      @stateHistory = []

    back : ->
      location.hash = @stateHistory[@stateHistory.length - 2]

    
    # Use this function if you want PageSlider to automatically determine the sliding direction based on the state history
    slidePage : (page) ->
      l = @stateHistory.length
      state = window.location.hash
      if l is 0
        @stateHistory.push state
        @slidePageFrom page
        return
      if state is @stateHistory[l - 2]
        @stateHistory.pop()
        @slidePageFrom page, "page-left"
      else

        @stateHistory.push state
        @slidePageFrom page, "page-right"

    
    # Use this function directly if you want to control the sliding direction outside PageSlider
    slidePageFrom:  (page, from) ->
      @container.append page
      if not @currentPage or not from
        page.attr "class", "page page-center"
        @currentPage = page
        return
      
      # Position the page at the starting position of the animation
      page.attr "class", "page " + from
      @currentPage.one "webkitTransitionEnd", (e) ->
        $(e.target).remove()

      
      # Force reflow. More information here: http://www.phpied.com/rendering-repaint-reflowrelayout-restyle/
      @container[0].offsetWidth
      
      # Position the new page and the current page at the ending position of their animation with a transition class indicating the duration of the animation
      page.attr "class", "page transition page-center"
      @currentPage.attr "class", "page transition " + ((if from is "page-left" then "page-right" else "page-left"))
      @currentPage = page

