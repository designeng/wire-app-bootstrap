# serviseHub
define [
    "wire"
], (wire) ->

    # controller
    sendRequestSpy = jasmine.createSpy('sendRequest')

    define 'serviseHubController', () ->
        class ServiseHubController

            # @injected (serviseHub plugin) 
            services: undefined

            sendRequest: (req) ->
                sendRequestSpy(req)

            getService: (name) ->
                return @services[name]

    # spec
    serviseHubSpec = 
        $plugins:[
            "core/plugin/serviseHub"
        ]

        controller:
            create: "serviseHubController"

            ready:
                "sendRequest": 
                    service: "stubService"
                    data:
                        towns: ["Moscow", "Paris"]

            bindToService: [
                "stubService"
            ]

    describe "serviseHub plugin integration", ->

        beforeEach (done) ->
            wire(serviseHubSpec).then (@ctx) =>           
                done()
            .otherwise (err) ->
                console.log "ERROR", err

        it "controller", (done) ->
            expect(@ctx.controller).toBeDefined()
            done()

        it "controller has services property", (done) ->
            expect(@ctx.controller.services).toBeDefined()
            done()

        it "controller sendRequest called", (done) ->
            expect(sendRequestSpy).toHaveBeenCalledWith
                service: "stubService"
                data:
                    towns: ["Moscow", "Paris"]
            done()

        it "controller getService call returns valid service", (done) ->
            expect(@ctx.controller.getService("stubService").path).toBeString()
            expect(@ctx.controller.getService("stubService").path).toBe "service/stub"
            done()