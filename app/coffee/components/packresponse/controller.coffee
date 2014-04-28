define ->
    class PassengerController

        # @injected
        passengerView: undefined

        # @injected
        _form: undefined

        mapModelToView: () ->
            console.log "____mapModelToView", @passengerModel, @form
            
            setTimeout(()=>
                @_updateForm @_form, @passengerModel
            , 1000)
            
            return