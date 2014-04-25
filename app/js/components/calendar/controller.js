define(["moment"], function(moment) {
  var CalendarController;
  return CalendarController = (function() {
    function CalendarController() {
      var num;
      num = moment().startOf('month').day();
      this.blankCount = num - 1;
    }

    return CalendarController;

  })();
});
