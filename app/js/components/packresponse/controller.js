define(function() {
  var PassengerController;
  return PassengerController = (function() {
    function PassengerController() {}

    PassengerController.prototype.passengerView = void 0;

    PassengerController.prototype._form = void 0;

    PassengerController.prototype.mapModelToView = function() {
      console.log("____mapModelToView", this.passengerModel, this._form);
      this._updateForm(this._form, this.passengerModel);
    };

    return PassengerController;

  })();
});
