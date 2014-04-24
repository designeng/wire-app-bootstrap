define(function() {
  var NavTabsController;
  return NavTabsController = (function() {
    function NavTabsController() {}

    NavTabsController.prototype.searchHandler = function() {
      return console.log("searchHandler", this.search);
    };

    NavTabsController.prototype.basketHandler = function() {
      return console.log("basketHandler", this.basket);
    };

    return NavTabsController;

  })();
});
