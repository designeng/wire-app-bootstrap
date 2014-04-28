define ->
	$plugins: [
        'wire/debug'
        'cola'
    ]

    $exports:
        $ref: 'collection'

    identifyByPort:
        create:
            module: 'cola/identifier/property'
            args: [ 'port' ]

	collection:
        create:
            module: 'cola/Collection'
            args: {identifier: { $ref: 'identifyByPort' }}
        ready:
            "addSource": {$ref: "source"}

    source:
        create: "components/autocomplete/list/collection/listCollectionSource"