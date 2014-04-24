define
    $plugins: [
        "wire/debug"
        "core/plugin/specRouter"
    ]

    controller:
        create:
            module: "components/testroutecomp/controller"
        ready:
            "onReady": {}
        specRouter:
            routes:
                "two/route": "oneRouteHandler"
                "one/route/next": "oneRouteNextHandler"
                "three/{id}": "threeRouteHandler"
                "three/five/{seven}" : "nextRouteHandler"

