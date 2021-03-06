define(function() {
  return {
    $plugins: ['wire/debug', 'wire/dom', 'wire/dom/render', "core/plugin/specRouter"],
    root: {
      $ref: 'dom.first!#application'
    },
    navtabsController: {
      create: "components/navtabs/controller",
      properties: {
        template: {
          $ref: 'navtabsView'
        },
        search: {
          $ref: 'dom.first!.search',
          at: 'navtabsView'
        },
        basket: {
          $ref: 'dom.first!.basket',
          at: 'navtabsView'
        },
        searchPanel: {
          $ref: 'dom.first!.searchPanel',
          at: 'navtabsView'
        },
        basketPanel: {
          $ref: 'dom.first!.basketPanel',
          at: 'navtabsView'
        },
        calendar: {
          $ref: 'dom.first!.calendar',
          at: 'navtabsView'
        },
        packresponse: {
          $ref: 'dom.first!.passengers',
          at: 'navtabsView'
        }
      },
      specRouter: {
        routes: {
          "search": "searchHandler",
          "basket": "basketHandler"
        }
      }
    },
    navtabsView: {
      render: {
        template: {
          module: "text!components/navtabs/template.html"
        },
        css: {
          module: "css!components/navtabs/navtabs.css"
        }
      },
      insert: {
        after: 'root'
      }
    },
    autocompliteForm: {
      wire: {
        spec: "components/autocomplete/spec",
        provide: {
          searchPage: {
            $ref: "navtabsController.searchPanel"
          }
        }
      }
    },
    calendar: {
      wire: {
        spec: "components/calendar/spec",
        provide: {
          calendarPage: {
            $ref: "navtabsController.calendar"
          }
        }
      }
    },
    calendar: {
      wire: {
        spec: "components/packresponse/spec",
        provide: {
          packresponsePage: {
            $ref: "navtabsController.packresponse"
          }
        }
      }
    }
  };
});
