# serviceHub
define [
    "wire"
], (wire) ->

    # controller
    sendRequestSpy = jasmine.createSpy('sendRequest')

    define 'serviceHubController', () ->
        class serviceHubController

            # @injected (serviceHub plugin) 
            services: undefined

            sendRequest: (req) ->
                sendRequestSpy(req)

            getService: (name) ->
                return @services[name]

    # spec
    serviceHubSpec = 
        $plugins:[
            "rest/wire"
            "core/plugin/serviceHub"
        ]

        client:
            rest: [
                module: 'rest/interceptor/mime'
                module: 'rest/interceptor/errorCode'
                module: 'rest/interceptor/entity'
            ]

        controller:
            create: "serviceHubController"

            ready:
                "sendRequest": 
                    service: "stubService"
                    data:
                        towns: ["Moscow", "Paris"]

            bindToService: [
                "stubService"
            ]

    describe "serviceHub plugin integration", ->

        beforeEach (done) ->
            wire(serviceHubSpec).then (@ctx) =>           
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