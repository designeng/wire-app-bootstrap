define(function() {
  var PassengerController;
  return PassengerController = (function() {
    function PassengerController() {}

    PassengerController.prototype.passengerView = void 0;

    PassengerController.prototype._form = void 0;

    PassengerController.prototype.mapModelToView = function() {
      var _this = this;
      console.log("____mapModelToView", this.passengerModel, this.form);
      setTimeout(function() {
        return _this._updateForm(_this._form, _this.passengerModel);
      }, 1000);
    };

    return PassengerController;

  })();
});
