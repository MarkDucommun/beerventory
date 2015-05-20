@beerventory.directive 'beer', (
  DirectiveState
) ->
  restrict: 'E'
  scope:
    beer: '=instance'
    delete: '&'
  templateUrl: 'directives/beer.html'
  link: (scope, element, attrs) ->

    scope.state = DirectiveState.new()

    scope.afterSave = (beer) ->
      scope.state.stopEditing()
      scope.beer = beer
