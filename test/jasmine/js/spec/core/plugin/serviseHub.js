define(["wire"], function(wire) {
  var sendRequestSpy, serviseHubSpec;
  sendRequestSpy = jasmine.createSpy('sendRequest');
  define('serviseHubController', function() {
    var ServiseHubController;
    return ServiseHubController = (function() {
      function ServiseHubController() {}

      ServiseHubController.prototype.services = void 0;

      ServiseHubController.prototype.sendRequest = function(req) {
        return sendRequestSpy(req);
      };

      ServiseHubController.prototype.getService = function(name) {
        return this.services[name];
      };

      return ServiseHubController;

    })();
  });
  serviseHubSpec = {
    $plugins: ["core/plugin/serviseHub"],
    controller: {
      create: "serviseHubController",
      ready: {
        "sendRequest": {
          service: "stubService",
          data: {
            towns: ["Moscow", "Paris"]
          }
        }
      },
      bindToService: ["stubService"]
    }
  };
  return describe("serviseHub plugin integration", function() {
    beforeEach(function(done) {
      var _this = this;
      return wire(serviseHubSpec).then(function(ctx) {
        _this.ctx = ctx;
        return done();
      }).otherwise(function(err) {
        return console.log("ERROR", err);
      });
    });
    it("controller", function(done) {
      expect(this.ctx.controller).toBeDefined();
      return done();
    });
    it("controller has services property", function(done) {
      expect(this.ctx.controller.services).toBeDefined();
      return done();
    });
    it("controller sendRequest called", function(done) {
      expect(sendRequestSpy).toHaveBeenCalledWith({
        service: "stubService",
        data: {
          towns: ["Moscow", "Paris"]
        }
      });
      return done();
    });
    return it("controller getService call returns valid service", function(done) {
      expect(this.ctx.controller.getService("stubService").path).toBeString();
      expect(this.ctx.controller.getService("stubService").path).toBe("service/stub");
      return done();
    });
  });
});
