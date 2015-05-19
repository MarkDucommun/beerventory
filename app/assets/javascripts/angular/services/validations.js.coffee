@beer.service 'Validations', ->
  required: (field) ->
    field.$dirty && field.$error.required
