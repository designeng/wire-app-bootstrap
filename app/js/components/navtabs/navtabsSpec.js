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
    }
  };
});
