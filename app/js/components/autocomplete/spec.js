define(function() {
  return {
    $plugins: ['wire/debug', 'wire/on', 'wire/dom', 'wire/dom/render', 'wire/connect', 'cola'],
    $exports: {
      $ref: 'autocompleteController'
    },
    autocompleteController: {
      create: "components/autocomplete/controller",
      connect: {
        'testsCollection.onEdit': 'onItemClick'
      }
    },
    autocompleteView: {
      render: {
        template: {
          module: "text!components/autocomplete/template.html"
        },
        css: {
          module: "css!components/autocomplete/styles.css"
        }
      },
      insert: {
        at: {
          $ref: 'searchPage'
        }
      },
      on: {
        'click:.item': 'listCollection.edit'
      },
      bind: {
        to: {
          $ref: 'listCollection'
        },
        bindings: {
          port: '.port'
        }
      }
    },
    listCollection: {
      wire: "components/autocomplete/collection/colSpec"
    }
  };
});
