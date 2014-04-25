define(["moment", 'cola/adapter/Array'], function(moment, ArrayAdapter) {
  var days, num, source;
  num = moment().startOf('month').day();
  this.blankCount = num - 1;
  days = [
    {
      id: "0",
      day: "one"
    }, {
      id: "1",
      day: "two"
    }
  ];
  source = new ArrayAdapter(days);
  return source;
});
