# serviceHub
define [
    "wire"
    "meld"
], (wire, meld) ->

    # controller
    define 'serviceHubController', () ->
        class serviceHubController

            # {Rest.Client}
            # @injected by serviceHub plugin
            client: undefined

            # {Object}
            # @injected by serviceHub plugin 
            services: undefined

            # @param {String} serviceName
            # @param {Object} data
            # @param {String} method
            # {Function}
            # @injected by serviceHub plugin
            sendRequest: undefined

            # {Function}
            # @injected by serviceHub plugin
            sendRequestErrback: undefined

            setCurrent: (entity) ->
                @current = entity

            getCurrent: ->
                @current

            onReady: ->
                meld.after @, "sendRequest", (resultEntity) =>
                    @setCurrent(resultEntity)

    # wire spec
    serviceHubSpec = 
        $plugins:[
            "core/plugin/serviceHub"
        ]

        controller:
            create: "serviceHubController"

            ready:
                "onReady": {}
                "sendRequest": ["stubService", {towns: ["Moscow", "Paris"]}]

            bindToService: [
                "stubService"
            ]

    # jasmine specifications
    describe "serviceHub integration with rest client", ->

        beforeEach (done) ->
            wire(serviceHubSpec).then (@ctx) =>
                done()
            .otherwise (err) ->
                console.log "ERROR", err

        it "controller has client property", (done) ->
            expect(@ctx.controller.client).toBeDefined()
            done()

        it "controller has sendRequest function", (done) ->
            expect(@ctx.controller.sendRequest).toBeDefined()
            done()

        it "controller must have @current {Object} promise", (done) ->
            expect(@ctx.controller.getCurrent()).toBeObject()
            done()