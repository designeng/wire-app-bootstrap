path = require "path"
grunt = require "grunt"

ConnectMW = {}

ConnectMW.folderMount = (connect, point) ->
    return connect.static path.resolve(point)

# "service/stub"
ConnectMW.stubService = (req, res, next) ->
    if (req.url).match new RegExp("service/autocomplete")

        airports = ["Moscow", "Paris", "Tokio", "Rome", "London" ]
        id = 0
        body = 
            airports: []

        for port in airports
            body.airports.push {id: id, port: port}
            id++

        res.setHeader "Content-Type", "application/json; charset=utf-8"
        res.write JSON.stringify body
        res.end()

    else
        next()



# package response
ConnectMW.packResponse = (req, res, next) ->
    if (req.url).match new RegExp("service/mock/pack/response")

        response = grunt.file.readJSON __dirname + "/../response/packresponse.json"

        res.setHeader "Content-Type", "application/json; charset=utf-8"
        res.write JSON.stringify response
        res.end()

    else
        next()



module.exports = ConnectMW
