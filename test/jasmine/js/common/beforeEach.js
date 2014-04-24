define(["marionette", "underscore"], function(Marionette, _) {
  return beforeEach(function() {
    jasmine.Expectation.addMatchers({
      toBeInstanceOf: function(type) {
        return this.actual instanceof type;
      }
    });
    return jasmine.addMatchers({
      toBeString: function() {
        return {
          compare: function(actual) {
            return {
              pass: _.isString(actual)
            };
          }
        };
      },
      toBeObject: function() {
        return {
          compare: function(actual) {
            return {
              pass: _.isObject(actual)
            };
          }
        };
      }
    });
  });
});
