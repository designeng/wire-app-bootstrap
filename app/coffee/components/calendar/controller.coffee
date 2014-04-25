define [
    "moment"
], (moment) ->

    class CalendarController

        constructor: ->
            # first day of month in week grid
            # it must be changed on not current month
            num = moment().startOf('month').day()
            # need to add blank tags
            @blankCount = num - 1


