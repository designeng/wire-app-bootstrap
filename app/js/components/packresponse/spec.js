define(function() {
  return {
    $plugins: ['wire/debug', 'wire/on', 'wire/dom', 'wire/dom/render', 'wire/connect', 'cola'],
    $exports: {
      $ref: 'passengerController',
      $ref: 'passengerView'
    },
    passengerController: {
      create: {
        module: "components/packresponse/controller"
      },
      properties: {
        _form: {
          $ref: 'passengerView'
        },
        _updateForm: {
          $ref: 'form.setValues'
        }
      }
    },
    passengerCollection: {
      wire: "components/packresponse/collection/collectionSpec"
    },
    passengerView: {
      render: {
        template: {
          module: "text!components/packresponse/template.html"
        }
      },
      insert: {
        at: {
          $ref: 'packresponsePage'
        }
      },
      bind: {
        to: {
          $ref: 'passengerCollection'
        },
        bindings: {
          firstName: '.firstName',
          lastName: '.lastName',
          birthDate: '.birthDate'
        }
      }
    },
    form: {
      module: 'cola/dom/form'
    }
  };
});
