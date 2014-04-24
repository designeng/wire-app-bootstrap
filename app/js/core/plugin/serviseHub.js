define(["underscore", "core/servicehub/serviceMap"], function(_, serviceMap) {
  return function(options) {
    var bindToServiceFacet, service;
    service = function(facet, options, wire) {
      var serv, services, target, _i, _len, _results;
      target = facet.target;
      services = facet.options;
      if (_.isArray(services)) {
        target.services = {};
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
          ready: bindToServiceFacet
        }
      }
    };
  };
});
