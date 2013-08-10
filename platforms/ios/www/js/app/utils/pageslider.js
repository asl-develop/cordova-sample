(function() {
  define(function(require) {
    "use strict";
    var $, PageSlider;
    $ = require("jquery");
    return PageSlider = (function() {
      function PageSlider(container) {
        this.container = container;
        this.currentPage = void 0;
        this.stateHistory = [];
      }

      PageSlider.prototype.back = function() {
        return location.hash = this.stateHistory[this.stateHistory.length - 2];
      };

      PageSlider.prototype.slidePage = function(page) {
        var l, state;
        l = this.stateHistory.length;
        state = window.location.hash;
        if (l === 0) {
          this.stateHistory.push(state);
          this.slidePageFrom(page);
          return;
        }
        if (state === this.stateHistory[l - 2]) {
          this.stateHistory.pop();
          return this.slidePageFrom(page, "page-left");
        } else {
          this.stateHistory.push(state);
          return this.slidePageFrom(page, "page-right");
        }
      };

      PageSlider.prototype.slidePageFrom = function(page, from) {
        this.container.append(page);
        if (!this.currentPage || !from) {
          page.attr("class", "page page-center");
          this.currentPage = page;
          return;
        }
        page.attr("class", "page " + from);
        this.currentPage.one("webkitTransitionEnd", function(e) {
          return $(e.target).remove();
        });
        this.container[0].offsetWidth;
        page.attr("class", "page transition page-center");
        this.currentPage.attr("class", "page transition " + (from === "page-left" ? "page-right" : "page-left"));
        return this.currentPage = page;
      };

      return PageSlider;

    })();
  });

}).call(this);

/*
//@ sourceMappingURL=pageslider.js.map
*/