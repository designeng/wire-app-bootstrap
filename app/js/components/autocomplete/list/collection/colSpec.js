define(function() {
  return {
    $plugins: ['wire/debug', 'cola'],
    $exports: {
      $ref: 'listCollection'
    },
    listCollection: {
      create: {
        module: 'cola/Collection'
      },
      ready: {
        "addSource": {
          $ref: "source"
        }
      }
    },
    source: {
      create: "components/autocomplete/list/collection/listCollectionSource"
    }
  };
});