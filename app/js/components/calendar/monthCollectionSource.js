define(["moment", 'cola/adapter/Array'], function(moment, ArrayAdapter) {
  var days, source;
  days = [
    {
      id: 0,
      day: "one"
    }, {
      id: 1,
      day: "two"
    }
  ];
  source = new ArrayAdapter(days);
  return source;
});
