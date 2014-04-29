# serviseHub
define [
    "wire"
], (wire) ->

    # controller
    define 'serviseHubController', () ->
        class ServiseHubController

            # @injected
            client: undefined

            # @injected (serviseHub plugin)
            services: undefined

            sendRequest: (req) ->
                @client("/service/autocomplete").then (response) =>
                    @setCurrent response

            sendRequestWithData: (serviceName, data) ->
                @client({path:"/service/autocomplete", params: data}).then (response) =>
                    @setCurrent response

            getService: (name) ->
                return @services[name]

            setCurrent: (entity) ->
                @current = entity

            getCurrent: ->
                @current

    # spec
    serviseHubSpec = 
        $plugins:[
            "rest/wire"
            "core/plugin/serviseHub"
        ]

        client:
            rest: [
                module: 'rest/interceptor/mime'
                module: 'rest/interceptor/errorCode'
                module: 'rest/interceptor/entity'
            ]

        controller:
            create: "serviseHubController"

            ready:
                "sendRequest": 
                    service: "stubService"
                    data:
                        towns: ["Moscow", "Paris"]

            properties:
                client: {$ref: 'client'}

            bindToService: [
                "stubService"
            ]

    describe "serviseHub integration with rest client", ->

        beforeEach (done) ->
            wire(serviseHubSpec).then (@ctx) =>   
                done()
            .otherwise (err) ->
                console.log "ERROR", err

        it "controller has client property", (done) ->
            expect(@ctx.controller.client).toBeDefined()
            done()

        it "controller sendRequest must return sensible object in response", (done) ->
            parsed = JSON.parse @ctx.controller.getCurrent()
            expect(parsed).toBeObject()
            done()

        it "controller client call with data", (done) ->
            @ctx.controller.sendRequestWithData("stubService", {towns: ["Moscow", "Paris"]})
            expect(@ctx.controller.client).toBeDefined()
            done()