@beerventory.service 'Validations', ->
  # Validations

  required: (field) ->
    field.$dirty && field.$error.required

  number: (field) ->
    field.$dirty && field.$error.number

  min: (field) ->
    field.$dirty && field.$error.min

  max: (field) ->
    field.$dirty && field.$error.max

  valid: (field) ->
    field.$dirty && field.$valid

  invalid: (field) ->
    field.$dirty && field.$invalid

  # Other methods

  decorate: (object, fnArray) ->
    that = this
    _.each fnArray, (fnName) ->
      object[fnName] = -> that[fnName](object.field)
    return object

  createFns: (field, fnArray) ->
    object =
      field: field
    this.decorate(object, fnArray)
