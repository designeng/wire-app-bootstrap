define(function() {
  var AutoCompleteController;
  return AutoCompleteController = (function() {
    function AutoCompleteController() {}

    AutoCompleteController.prototype.onItemClick = function(item) {
      return console.log("___onItemClick");
    };

    return AutoCompleteController;

  })();
});
