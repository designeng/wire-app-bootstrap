# navtabsSpec
define ->

    $plugins: [
        # 'wire/debug'
        'wire/on'
        'wire/dom'
        'wire/dom/render'
        'wire/connect'
        'cola'
    ]

    $exports:
        $ref: 'autocompleteFormController'

    autocompleteFormController:
        create: "components/autocomplete/controller"
        properties:
            input: {$ref: 'input'}
            list: {$ref: 'list'}
            listCollection: {$ref: 'listCollection'}
        ready: {}
        connect:
            'listCollection.onEdit': 'onItemClick'

    # wrapper for input and list
    autocompleteFormView:
        render:
            template:
                module: "text!components/autocomplete/form.html"
            css:
                module: "css!components/autocomplete/styles.css"

        insert:
            at: {$ref: 'slot'}

    list:
        render:
            template:
                module: "text!components/autocomplete/list/template.html"
            css:
                module: "css!components/autocomplete/list/styles.css"
        insert:
            at: {$ref: 'dom.first!.listWrapper', at: {$ref: 'autocompleteFormView'}}
        on:
            'click:.item': 'listCollection.edit'
        bind:
            to:
                $ref: 'listCollection'
            bindings:
                port: '.port'

    listCollection:
        wire: "components/autocomplete/list/collection/spec"

    input: 
        render:
            template:
                module: "text!components/autocomplete/input/template.html"
            css:
                module: "css!components/autocomplete/input/style.css"
        insert:
            at: {$ref: 'dom.first!.inputWrapper', at: {$ref: 'autocompleteFormView'}}
        on:
            'keyup': 'autocompleteFormController.onTextInputKeyUp'

