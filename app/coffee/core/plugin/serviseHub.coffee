define [
    "underscore"
    "core/servicehub/serviceMap"
], (_, serviceMap) ->

    return (options) ->

        service = (facet, options, wire) ->
            target = facet.target
            services = facet.options

            if _.isArray services
                target.services = {}
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
                ready: bindToServiceFacet