define(["wire"], function(wire) {
  var serviseHubSpec;
  define('serviseHubController', function() {
    var ServiseHubController;
    return ServiseHubController = (function() {
      function ServiseHubController() {}

      ServiseHubController.prototype.client = void 0;

      ServiseHubController.prototype.services = void 0;

      ServiseHubController.prototype.sendRequest = function(req) {
        var _this = this;
        return this.client("/service/autocomplete").then(function(response) {
          return _this.setCurrent(response);
        });
      };

      ServiseHubController.prototype.sendRequestWithData = function(serviceName, data) {
        var _this = this;
        return this.client({
          path: "/service/autocomplete",
          params: data
        }).then(function(response) {
          return _this.setCurrent(response);
        });
      };

      ServiseHubController.prototype.getService = function(name) {
        return this.services[name];
      };

      ServiseHubController.prototype.setCurrent = function(entity) {
        return this.current = entity;
      };

      ServiseHubController.prototype.getCurrent = function() {
        return this.current;
      };

      return ServiseHubController;

    })();
  });
  serviseHubSpec = {
    $plugins: ["rest/wire", "core/plugin/serviseHub"],
    client: {
      rest: [
        {
          module: 'rest/interceptor/mime',
          module: 'rest/interceptor/errorCode',
          module: 'rest/interceptor/entity'
        }
      ]
    },
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
      properties: {
        client: {
          $ref: 'client'
        }
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
    it("controller sendRequest must return sensible object in response", function(done) {
      var parsed;
      parsed = JSON.parse(this.ctx.controller.getCurrent());
      expect(parsed).toBeObject();
      return done();
    });
    return it("controller client call with data", function(done) {
      this.ctx.controller.sendRequestWithData("stubService", {
        towns: ["Moscow", "Paris"]
      });
      expect(this.ctx.controller.client).toBeDefined();
      return done();
    });
  });
});
