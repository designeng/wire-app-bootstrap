# require [
#     "wire"
#     "wire!bootstrapSpec"
#     "routerMainSpec"
# ], (wire, bootstrapCTX, routerMainSpec) ->

#     bootstrapCTX.wire(
#         routerMainSpec
#     ).then (resultCTX) ->
#         console.log "resultCTX::::", resultCTX



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

require [
    "wire"
    "wire!components/navtabs/navtabsSpec"
    "hasher"
], (wire, navtabsSpec, hasher) ->

    navtabsSpec.wire(
        
    ).then (resultCTX) ->
        console.log "resultCTX::::", resultCTX

        hasher.init()
