define ->
    $plugins: [
        # 'wire/debug'
        'cola'
    ]

    $exports:
        $ref: 'collection'

    collection:
        create:
            module: 'cola/Collection'
        ready:
            "addSource": {$ref: "source"}

    source:
        create: "components/packresponse/collection/collectionSource"