define(['cola/adapter/Object', 'rest', 'rest/interceptor/mime', 'rest/interceptor/entity', 'when'], function(ObjectAdapter, rest, mime, entity, When) {
  var client, serviceDefered;
  serviceDefered = When.defer();
  client = rest.chain(mime).chain(entity);
  client({
    path: '/service/json/pack/response'
  }).then(function(response) {
    var source;
    console.log("___response.data.pack.persons[0]", response.data.pack.persons[0]);
    source = new ObjectAdapter(response.data.pack.persons[0]);
    return serviceDefered.resolve(source);
  }, function(error) {
    return console.log("SERVICE ERROR:", error);
  });
  return serviceDefered.promise;
});
