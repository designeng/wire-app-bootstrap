# routerMainSpec
define
    $plugins: [
        "wire/debug"
        "wire/dom"
        "core/plugin/contextRouter"
    ]

    appRouter:
        contextRouter: 
            routes:
                "autocomplete"  :   
                    spec: "components/autocomplete/spec"
                    slot: {$ref: "dom.first!#page"}
                "packresponse"  :   
                    spec: "components/packresponse/spec"
                    slot: {$ref: "dom.first!#page"}
