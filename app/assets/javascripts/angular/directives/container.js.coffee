@beerventory.directive 'container', (
  DirectiveState
) ->
  restrict: 'E'
  scope:
    container: '=instance'
    delete: '&'
  templateUrl: 'directives/container.html'
  link: (scope, element, attrs) ->

    scope.state = DirectiveState.new()

    scope.afterSave = (container) ->
      scope.state.stopEditing()
      scope.container = container
