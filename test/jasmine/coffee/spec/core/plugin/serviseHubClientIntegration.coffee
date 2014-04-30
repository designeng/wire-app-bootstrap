# serviseHub
define [
    "wire"
    "meld"
], (wire, meld) ->

    # controller
    define 'serviseHubController', () ->
        class ServiseHubController

            # {Rest.Client}
            # @injected by serviseHub plugin
            client: undefined

            # {Object}
            # @injected by serviseHub plugin 
            services: undefined

            # @param {String} serviceName
            # @param {Object} data
            # @param {String} method
            # {Function}
            # @injected by serviseHub plugin
            sendRequest: undefined

            # {Function}
            # @injected by serviseHub plugin
            sendRequestErrback: undefined

            setCurrent: (entity) ->
                @current = entity

            getCurrent: ->
                @current

            onReady: ->
                meld.after @, "sendRequest", (resultEntity) =>
                    @setCurrent(resultEntity)

    # wire spec
    serviseHubSpec = 
        $plugins:[
            "core/plugin/serviseHub"
        ]

        controller:
            create: "serviseHubController"

            ready:
                "onReady": {}
                "sendRequest": ["stubService", {towns: ["Moscow", "Paris"]}]

            bindToService: [
                "stubService"
            ]

    # jasmine specifications
    describe "serviseHub integration with rest client", ->

        beforeEach (done) ->
            wire(serviseHubSpec).then (@ctx) =>
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