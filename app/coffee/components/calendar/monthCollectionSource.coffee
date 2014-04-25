define [
    "moment"
    'cola/adapter/Array'
], (moment, ArrayAdapter) ->

    # first day of month in week grid
    # it must be changed on not current month
    num = moment().startOf('month').day()
    # need to add blank tags
    @blankCount = num - 1

    days = [{id: "0", day: "one"}, {id: "1", day: "two"}]

    source = new ArrayAdapter(days)

    return source