define(['cola/adapter/Array', 'rest', 'rest/interceptor/mime', 'rest/interceptor/entity', 'when'], function(ArrayAdapter, rest, mime, entity, When) {
  var client, serviceDefered;
  serviceDefered = When.defer();
  client = rest.chain(mime).chain(entity);
  client({
    path: '/service/mock/pack/response'
  }).then(function(response) {
    var source;
    source = new ArrayAdapter(response.data.pack.persons);
    return serviceDefered.resolve(source);
  }, function(error) {
    return console.log("SERVICE ERROR:", error);
  });
  return serviceDefered.promise;
});
