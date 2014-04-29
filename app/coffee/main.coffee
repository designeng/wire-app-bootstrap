# it works with contextRouter

require [
    "wire"
    "hasher"
    "wire!bootstrapSpec"
    "routerMainSpec"
], (wire, hasher, bootstrapCTX, routerMainSpec) ->

    bootstrapCTX.wire(
        routerMainSpec
    ).then (resultCTX) ->

        hasher.prependHash = ""
        hasher.init()

        console.log "resultCTX::::", resultCTX

# it works with specRouter

# components/testroutecomp/childSpec
# require [
#     "wire"
#     "wire!components/testroutecomp/childSpec"
#     "hasher"
# ], (wire, childSpec, hasher) ->

#     childSpec.wire(
        
#     ).then (resultCTX) ->
#         console.log "resultCTX::::", resultCTX

#         hasher.init()


# it works with specRouter

# require [
#     "wire"
#     "wire!components/navtabs/navtabsSpec"
#     "hasher"
# ], (wire, navtabsSpec, hasher) ->

#     navtabsSpec.wire(
        
#     ).then (resultCTX) ->
#         console.log "resultCTX::::", resultCTX

#         hasher.init()
