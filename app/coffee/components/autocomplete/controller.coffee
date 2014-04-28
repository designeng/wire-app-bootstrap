define ->
    class AutoCompleteController

        # @injected
        input: undefined

        # @injected
        list: undefined

        # @injected
        listCollection: undefined

        curId: 5

        onItemClick: (item) ->
            console.log "____click"


        onTextInputKeyUp: (e) ->
            console.log "_____ONKEYUP", @listCollection.adapters[0]._index

            @listCollection.add {port: e.target.value}