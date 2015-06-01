@beerventory.directive 'unitsList', ->
  restrict: 'E'
  scope:
    units: '=display'
  templateUrl: 'directives/units_list.html'
  link: (scope, element, attrs) ->
    scope.reverse = false
    scope.order = 'beer.name'

    scope.setOrder = (arg) ->
      if scope.order == arg
        scope.reverse = !scope.reverse
      else
        scope.reverse = false
        scope.order = arg
