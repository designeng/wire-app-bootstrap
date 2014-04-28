define(function() {
  return {
    $plugins: ['wire/debug', 'cola'],
    $exports: {
      $ref: 'model'
    },
    model: {
      create: {
        module: 'cola/Model'
      },
      ready: {
        "addSource": {
          $ref: "source"
        }
      }
    },
    source: {
      create: "components/packresponse/model/modelSource"
    }
  };
});
