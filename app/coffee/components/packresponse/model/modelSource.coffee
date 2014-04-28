define [
    'cola/adapter/Object'
    'rest'
    'rest/interceptor/mime'
    'rest/interceptor/entity'
    'when'
], (ObjectAdapter, rest, mime, entity, When) ->

    serviceDefered = When.defer()

    client = rest.chain(mime).chain(entity)

    client({path: '/service/mock/pack/response'}).then(
        (response) ->
            console.log "___response.data.pack.persons[0]", response.data.pack.persons[0]
            source = new ObjectAdapter(response.data.pack.persons[0])
            serviceDefered.resolve source
        , (error) ->
            console.log "SERVICE ERROR:", error
    )

    return serviceDefered.promise