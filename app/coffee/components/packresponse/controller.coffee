define ->
    class PassengerController

        # @injected
        passengerView: undefined

        # @injected
        _form: undefined

        mapModelToView: () ->
            console.log "____mapModelToView", @passengerModel, @_form

            @_updateForm @_form, @passengerModel
            
            return