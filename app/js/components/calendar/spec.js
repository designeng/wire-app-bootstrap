define(function() {
  return {
    $plugins: ['wire/debug', 'wire/on', 'wire/dom', 'wire/dom/render', 'cola'],
    $exports: {
      $ref: 'calendarController',
      $ref: 'calendarView'
    },
    calendarController: {
      create: "components/calendar/controller"
    },
    source: {
      create: "components/calendar/monthCollectionSource"
    },
    monthCollection: {
      create: {
        module: 'cola/Collection'
      },
      ready: {
        "addSource": {
          $ref: "source"
        }
      }
    },
    calendarView: {
      render: {
        template: {
          module: "text!components/calendar/template.html"
        },
        css: {
          module: "css!components/calendar/styles.css"
        }
      },
      insert: {
        at: {
          $ref: 'calendarPage'
        }
      }
    },
    calendarGrid: {
      render: {
        template: {
          module: "text!components/calendar/grid.html"
        }
      },
      insert: {
        at: {
          $ref: "dom.first!.calendarGrigWrapper",
          at: 'calendarView'
        }
      },
      bind: {
        to: {
          $ref: 'monthCollection'
        },
        bindings: {
          day: '.day'
        }
      }
    }
  };
});
