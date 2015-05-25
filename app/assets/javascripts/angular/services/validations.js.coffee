@beerventory.service 'Validations', ->
  # Validations

  required: (field) ->
    field.$touched && field.$error.required

  number: (field) ->
    field.$touched && field.$error.number

  min: (field) ->
    field.$touched && field.$error.min

  max: (field) ->
    field.$touched && field.$error.max

  valid: (field) ->
    field.$touched && field.$valid

  invalid: (field) ->
    field.$touched && field.$invalid

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
