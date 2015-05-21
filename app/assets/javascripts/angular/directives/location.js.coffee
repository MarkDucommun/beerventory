@beerventory.directive 'location', (
  DirectiveState
) ->
  restrict: 'E'
  scope:
    location: '=instance'
    delete: '&'
  templateUrl: 'directives/location.html'
  link: (scope, element, attrs) ->

    scope.state = DirectiveState.new()

    scope.afterSave = (location) ->
      scope.state.stopEditing()
      scope.location = location
