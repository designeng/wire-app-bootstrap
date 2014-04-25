# calendar spec
define ->

    $plugins: [
        'wire/debug'
        'wire/on'
        'wire/dom'
        'wire/dom/render'
        'cola'
    ]

    $exports:
        $ref: 'calendarController'

    calendarController:
        create: "components/calendar/controller"

    monthCollection:
        create:
            module: 'cola/Collection'
        ready:
            "addSource": {$ref: "source"}

    source:
        create: "components/calendar/monthCollectionSource"

    calendarView:
        render:
            template:
                module: "text!components/calendar/template.html"
            css:
                module: "css!components/calendar/styles.css"
            insert:
                at: {$ref: 'calendarPage'}

    calendarGrid:
        render:
            template:
                module: "text!components/calendar/grid.html"
        insert:
            at: { $ref: "dom.first!.calendarGrigWrapper", at: 'calendarView'} 
        bind:
            to:
                $ref: 'monthCollection'
            bindings:
                day: '.day'
