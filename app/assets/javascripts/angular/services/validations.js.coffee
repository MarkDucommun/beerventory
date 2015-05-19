@beerventory.service 'Validations', ->
  required: (field) ->
    field.$dirty && field.$error.required

  number: (field) ->
    field.$dirty && field.$error.number
