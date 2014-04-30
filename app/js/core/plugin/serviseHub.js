define(["underscore", "rest", "rest/interceptor/mime", "rest/interceptor/entity", "core/servicehub/serviceMap"], function(_, rest, mime, entity, serviceMap) {
  return function(options) {
    var bindToServiceFacet, dafaultCallback, dafaultErrback, service;
    dafaultCallback = function(response) {
      return console.log("DEFAULT RESPONSE", response);
    };
    dafaultErrback = function(response) {
      return console.error('response error: ', response);
    };
    service = function(facet, options, wire) {
      var serv, services, target, _i, _len, _results;
      target = facet.target;
      services = facet.options;
      if (_.isArray(services)) {
        target.services = {};
        target.client = rest.chain(mime).chain(entity);
        target["sendRequest"] = function(serviceName, data, method, callback, errback) {
          var path;
          if (this.services[serviceName]) {
            path = this.services[serviceName].path;
          } else {
            throw new Error("Not defined service '" + serviceName + "' in target services!");
          }
          method = method || "GET";
          data = data || {};
          callback = callback || dafaultCallback;
          errback = errback || dafaultErrback;
          if (!path) {
            throw new Error("Path is not defined!");
          }
          return this.client({
            path: path,
            data: data,
            method: method
          }).then(callback, errback);
        };
        _.bindAll(target, "sendRequest");
        _results = [];
        for (_i = 0, _len = services.length; _i < _len; _i++) {
          serv = services[_i];
          if (serviceMap[serv]) {
            _results.push(target.services[serv] = serviceMap[serv]);
          } else {
            throw new Error("Service is not defined! - " + serv);
          }
        }
        return _results;
      } else {
        return _.isString(services);
      }
    };
    bindToServiceFacet = function(resolver, facet, wire) {
      return resolver.resolve(service(facet, options, wire));
    };
    return {
      facets: {
        bindToService: {
          "ready": bindToServiceFacet
        }
      }
    };
  };
});
