define(["wire", "meld"], function(wire, meld) {
  var serviseHubSpec;
  define('serviseHubController', function() {
    var ServiseHubController;
    return ServiseHubController = (function() {
      function ServiseHubController() {}

      ServiseHubController.prototype.client = void 0;

      ServiseHubController.prototype.services = void 0;

      ServiseHubController.prototype.sendRequest = void 0;

      ServiseHubController.prototype.sendRequestErrback = void 0;

      ServiseHubController.prototype.setCurrent = function(entity) {
        return this.current = entity;
      };

      ServiseHubController.prototype.getCurrent = function() {
        return this.current;
      };

      ServiseHubController.prototype.onReady = function() {
        var _this = this;
        return meld.after(this, "sendRequest", function(resultEntity) {
          return _this.setCurrent(resultEntity);
        });
      };

      return ServiseHubController;

    })();
  });
  serviseHubSpec = {
    $plugins: ["core/plugin/serviseHub"],
    controller: {
      create: "serviseHubController",
      ready: {
        "onReady": {},
        "sendRequest": [
          "stubService", {
            towns: ["Moscow", "Paris"]
          }
        ]
      },
      bindToService: ["stubService"]
    }
  };
  return describe("serviseHub integration with rest client", function() {
    beforeEach(function(done) {
      var _this = this;
      return wire(serviseHubSpec).then(function(ctx) {
        _this.ctx = ctx;
        return done();
      }).otherwise(function(err) {
        return console.log("ERROR", err);
      });
    });
    it("controller has client property", function(done) {
      expect(this.ctx.controller.client).toBeDefined();
      return done();
    });
    it("controller has sendRequest function", function(done) {
      expect(this.ctx.controller.sendRequest).toBeDefined();
      return done();
    });
    return it("controller must have @current {Object} promise", function(done) {
      expect(this.ctx.controller.getCurrent()).toBeObject();
      return done();
    });
  });
});
