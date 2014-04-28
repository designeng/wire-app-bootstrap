define(function() {
  var AutoCompleteController;
  return AutoCompleteController = (function() {
    function AutoCompleteController() {}

    AutoCompleteController.prototype.input = void 0;

    AutoCompleteController.prototype.list = void 0;

    AutoCompleteController.prototype.listCollection = void 0;

    AutoCompleteController.prototype.curId = 5;

    AutoCompleteController.prototype.onItemClick = function(item) {
      return console.log("____click");
    };

    AutoCompleteController.prototype.onTextInputKeyUp = function(e) {
      console.log("_____ONKEYUP", this.listCollection.adapters[0]._index);
      return this.listCollection.add({
        port: e.target.value
      });
    };

    return AutoCompleteController;

  })();
});
