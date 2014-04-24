define(function() {
  var Controller;
  return Controller = (function() {
    function Controller() {}

    Controller.prototype.onReady = function() {
      return console.log("onReady");
    };

    Controller.prototype.oneRouteHandler = function() {
      return console.log("_____________oneRouteHandler");
    };

    Controller.prototype.oneRouteNextHandler = function() {
      return console.log("=============oneRouteNextHandler");
    };

    Controller.prototype.threeRouteHandler = function(id) {
      return console.log(">>>>>>>>>>>>threeRouteHandler", id);
    };

    Controller.prototype.nextRouteHandler = function(id) {
      return console.log(">>>>>>> > > > > > nextRouteHandler", id);
    };

    return Controller;

  })();
});
