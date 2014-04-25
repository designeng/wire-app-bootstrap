define(["jquery"], function($) {
  var AutoCompleteController;
  return AutoCompleteController = (function() {
    function AutoCompleteController() {}

    AutoCompleteController.prototype.input = void 0;

    AutoCompleteController.prototype.list = void 0;

    AutoCompleteController.prototype.onItemClick = function(item) {
      return console.log("____click");
    };

    AutoCompleteController.prototype.bindKeyUp = function() {
      return $(this.input).keyup(function(e) {
        return console.log(e.target.value);
      });
    };

    return AutoCompleteController;

  })();
});
