@beerventory.directive 'unitForm', (
  Validations,
  Container
) ->
  restrict: 'E'
  scope:
    unit: '='
    afterSave: '&'
  templateUrl: 'directives/unit_form.html'
  link: (scope, element, attrs) ->
      scope.containers = []

      Container.index().then (containers) ->
        scope.containers = containers

      scope.$watch 'unit', ->
        alert('ERROR: NOT A UNIT') if scope.unit.constructor.name != 'Unit'

      scope.$watch 'unitForm', ->
        scope.container =
          field: scope.unitForm.container
          required: -> Validations.required(this.field)

      scope.saveForm = ->
        debugger
        scope.unit.save().then (unit) ->
          scope.afterSave(unit: unit)
        scope.unitForm.$setPristine()
