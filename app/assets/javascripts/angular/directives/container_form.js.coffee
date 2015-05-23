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
      scope.type =
        field: scope.containerForm.type
        required: -> Validations.required(this.field)

      scope.volume =
        field: scope.containerForm.volume
        required: -> Validations.required(this.field)
        number: -> Validations.number(this.field)

      scope.volume_unit =
        field: scope.containerForm.volume_unit
        required: -> Validations.required(this.field)

    scope.saveContainerForm = ->
      scope.container.save().then (container) ->
        scope.afterSave(container: container)
      scope.containerForm.$setPristine()
