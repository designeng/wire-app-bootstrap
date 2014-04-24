define [
    "marionette"
    "underscore"
], (Marionette, _) ->

    beforeEach -> 
        # from fixture folder
        # loadFixtures("fixtureName.html")

        jasmine.Expectation.addMatchers toBeInstanceOf: (type) ->
            @actual instanceof type

        jasmine.addMatchers
            toBeString: () ->
                return {
                    compare: (actual) ->
                        return  {
                            pass: _.isString(actual)
                        }
                }
            toBeObject: () ->
                return {
                    compare: (actual) ->
                        return  {
                            pass: _.isObject(actual)
                        }
                }


