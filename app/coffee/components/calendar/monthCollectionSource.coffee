define [
    "moment"
    'cola/adapter/Array'
], (moment, ArrayAdapter) ->

    days = [{id: 0, day: "one"}, {id: 1, day: "two"}]

    source = new ArrayAdapter(days)

    return source