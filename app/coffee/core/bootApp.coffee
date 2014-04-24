define [
    "core/appinstance"
    "overridden"
], (App) ->

    App.addInitializer (options) ->
        console.log "App.addInitializer", options
        if !options.regionSelector
            throw new Error "Application region not specified!"

        App.addRegions 
            root: options.regionSelector
            pageRegion: "#page"

    App.renderAsRoot = (view) ->
        @pageRegion.show view

    return App