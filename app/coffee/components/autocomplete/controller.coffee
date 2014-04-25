define ["jquery"], ($) ->
    class AutoCompleteController

        # @injected
        input: undefined

        # @injected
        list: undefined

        onItemClick: (item) ->
            console.log "____click"

        bindKeyUp: ->
            $(@input).keyup (e) ->
                console.log e.target.value