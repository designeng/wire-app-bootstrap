# app router
define [
    "wire"
    "underscore"
    "hasher"
], (wire, _, hasher) ->
    
    oneRouteHandlerSpy = jasmine.createSpy('oneRouteHandler')
    anotherHandlerSpy = jasmine.createSpy('oneRouteHandler')

    # controllers
    define 'oneController', () ->
        class OneController

            # @injected (with specRouter plugin)
            router: undefined

            oneRouteHandler: () ->
                oneRouteHandlerSpy()

    define 'anotherController', () ->
        class AnotherController

            # @injected (with specRouter plugin)
            router: undefined

            anotherHandler: () ->
                anotherHandlerSpy()

    # spec
    specRouterSpec = 
        $plugins:[
            "core/plugin/specRouter"
        ]

        controller:
            create: "oneController"

            specRouter:
                routes:
                    "one/route": "oneRouteHandler"                

        anotherController:
            create: "anotherController"

            specRouter:
                routes:
                    "one/route": "anotherHandler"

    describe "specRouter plugin integration", ->

        location.href = "http://localhost:7788/test/jasmine/#/one/route"

        beforeEach (done) ->
            wire(specRouterSpec).then (@ctx) => 
                hasher.init()  
                done()
            .otherwise (err) ->
                console.log "ERROR", err

        it "controller", (done) ->
            expect(@ctx.controller).toBeDefined()
            done()

        it "controller has router property", (done) ->
            expect(@ctx.controller.router).toBeDefined()
            done()

        it "controller oneRouteHandler called", (done) ->
            expect(oneRouteHandlerSpy).toHaveBeenCalled()
            done()        

        it "controller oneRouteHandler called and anotherController anotherHandler called", (done) ->
            expect(oneRouteHandlerSpy).toHaveBeenCalled()
            expect(anotherHandlerSpy).toHaveBeenCalled()
            done()