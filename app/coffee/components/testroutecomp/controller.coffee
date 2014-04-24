define ->
    class Controller

        onReady: ->
            console.log "onReady"

        oneRouteHandler: () ->
            console.log "_____________oneRouteHandler"

        oneRouteNextHandler: () ->
            console.log "=============oneRouteNextHandler"

        threeRouteHandler: (id) ->
            console.log ">>>>>>>>>>>>threeRouteHandler", id

        nextRouteHandler: (id) ->
            console.log ">>>>>>> > > > > > nextRouteHandler", id
        