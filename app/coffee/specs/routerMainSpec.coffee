# routerMainSpec
define
    $plugins: [
        "wire/debug"
        "core/plugin/bbRouter"
    ]

    appRouter:
        bbRouter: 
            routes:
                "#one"  :   "components/testroutecomp/childSpec"
