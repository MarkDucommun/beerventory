@beerventory.directive 'containerForm', (
  Validations
) ->
  restrict: 'E'
  scope:
    container: '='
    afterSave: '&'
  templateUrl: 'directives/container_form.html'
  link: (scope, element, attrs) ->
    scope.types = [
      'Bottle'
      'Can'
    ]

    scope.volume_units = [
      'oz'
      'ml'
    ]

    scope.$watch 'container', ->
      alert('ERROR: NOT A CONTAINER') if scope.container.constructor.name != 'Container'

    scope.$watch 'containerForm', ->
      scope.nameFns = Validations.createFns scope.containerForm.name, [
        'valid',
        'invalid'
        ]

      scope.typeFns = Validations.createFns scope.containerForm.type, [
        'required',
        'valid',
        'invalid'
        ]

      scope.volumeFns = Validations.createFns scope.containerForm.volume, [
        'valid'
        'invalid'
        'required'
        'number'
        ]

      scope.volume_unitFns = Validations.createFns scope.containerForm.volume_unit, [
        'valid'
        'invalid'
        'required'
      ]

    scope.saveContainerForm = ->
      scope.container.save().then (container) ->
        scope.afterSave(container: container)
      scope.containerForm.$setPristine()
