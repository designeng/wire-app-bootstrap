define [
    "underscore"
    "when"
    "rest"
    "rest/interceptor/mime"
    "rest/interceptor/entity"
    "core/servicehub/serviceMap"
], (_, When, rest, mime, entity, serviceMap) ->

    return (options) ->

        # blank function
        dafaultCallback = (response) ->
            console.log "DEFAULT RESPONSE", response

        # default errback
        dafaultErrback = (response) ->
            console.error 'response error: ', response

        service = (facet, options, wire) ->
            target = facet.target
            services = facet.options

            if _.isArray services
                target.services = {}                
                target.client = rest.chain(mime)
                                    .chain(entity)

                target["sendRequest"] = (serviceName, data, method, callback, errback) ->
                    if @services[serviceName]
                        path = @services[serviceName].path
                    else
                        throw new Error("Not defined service '#{serviceName}' in target services!")

                    method = method || "GET"
                    data = data || {}
                    callback = callback || dafaultCallback
                    errback = errback || dafaultErrback
                    if !path
                        throw new Error("Path is not defined!")
                    # all is fine

                    defered = When.defer()
                    @client({ path: path, data: data, method: method}).then(
                        (response) ->
                            defered.resolve(response)
                            callback.call @, response
                        , errback
                    )
                    return defered.promise

                _.bindAll target, "sendRequest"

                for serv in services
                    if serviceMap[serv]
                        target.services[serv] = serviceMap[serv]

                    # TODO: return this error to promise reject
                    else
                        throw new Error("Service is not defined! - " + serv)
            else 
                _.isString services


        bindToServiceFacet = (resolver, facet, wire) ->
            resolver.resolve(service(facet, options, wire))

        facets: 
            bindToService: 
                "ready": bindToServiceFacet