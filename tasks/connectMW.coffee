path = require "path"

ConnectMW = {}

ConnectMW.folderMount = (connect, point) ->
    return connect.static path.resolve(point)

# "service/stub"
ConnectMW.stubService = (req, res, next) ->
    if (req.url).match new RegExp("service/stub")

        console.log "-----------stub request-------------"
        console.log "REQUEST URL:", req.url

        params = require('url').parse(req.url, true).query
        console.log "PARAMS:", params
        console.log "-----------/end request-------------"

        body = 
            europe: 
                towns: ["Moscow", "Paris"]

        res.setHeader "Content-Type", "application/json; charset=utf-8"
        res.write JSON.stringify body
        res.end()

    else
        next()

module.exports = ConnectMW