define [
    "moment"
    "jquery"
], (moment, $) ->

    class CalendarController

        onReady: ->
            # @collection.add {id:"test", day:"newDay"}
            # @collection.collect()

            console.log "___@collection", @collection

        afterUpdate: ->
            console.log "____afterUpdate"

        afterAdd: ->
            setTimeout(()=>
                grid = $(@calendarView).find("ul.calendarGrid")
                weekEnds = grid.find("li[data-cola-id='test']")
                console.log "____weekEnds.length", weekEnds, weekEnds.length
            , 10)

        onChange: ->
            console.log "______onChange", @collection.getProvider().origSource._array.length

            grid = $(@calendarView).find("ul.calendarGrid")
            weekEnds = grid.find("li[data-cola-id='test']")
            console.log "____weekEnds.length", weekEnds, weekEnds.length
            


