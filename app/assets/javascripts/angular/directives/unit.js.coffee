@beerventory.directive 'unit', (
  DirectiveState
) ->
  restrict: 'E'
  scope:
    unit: '=instance'
    delete: '&'
  templateUrl: 'directives/unit.html'
  link: (scope, element, attrs) ->

    scope.state = DirectiveState.new()

    scope.afterSave = (unit) ->
      scope.state.stopEditing()
      scope.unit = unit
