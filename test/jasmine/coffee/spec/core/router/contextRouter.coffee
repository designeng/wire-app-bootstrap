# app router
define [
    "wire"
    "underscore"
    "hasher"
], (wire, _, hasher) ->
    
    oneRouteHandlerSpy = jasmine.createSpy('oneRouteHandler')
    anotherHandlerSpy = jasmine.createSpy('oneRouteHandler')

    # spec
    specRouterSpec = 
        $plugins:[
            "core/plugin/contextRouter"
        ]

        controller:
            contextRouter:
                routes:
                    "autocomplete"  :   
                        spec: "components/autocomplete/spec"
                        slot: {$ref: "dom.first!body"}
                    "packresponse"  :   
                        spec: "components/packresponse/spec"
                        slot: {$ref: "dom.first!body"}

    describe "contextRouter plugin integration", ->

        beforeEach (done) ->
            wire(specRouterSpec).then (@ctx) => 
                hasher.prependHash = ""
                hasher.init()
                console.log "__@ctx.controller", @ctx.controller
                done()
            .otherwise (err) ->
                console.log "ERROR", err

        # test for Crossroads._routes
        it "controller has _routes property", (done) ->
            expect(@ctx.controller._routes).toBeArray()
            done()

        it "controller routes in array ['autocomplete', 'packresponse']", (done) ->
            for route in @ctx.controller._routes
                expect(route._pattern).toBeInArray ["autocomplete", "packresponse"]
            done()