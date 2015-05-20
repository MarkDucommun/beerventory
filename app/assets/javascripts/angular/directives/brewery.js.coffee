@beerventory.directive 'brewery', (
  DirectiveState
) ->
  restrict: 'E'
  scope:
    brewery: '=instance'
    delete: '&'
  templateUrl: 'directives/brewery.html'
  link: (scope, element, attrs) ->

    scope.state = DirectiveState.new()

    scope.afterSave = (brewery) ->
      scope.state.stopEditing()
      scope.brewery = brewery
