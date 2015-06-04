@beerventory.directive 'buttonGroup', ->
    restrict: 'E'
    scope:
      buttons: '='
      order: '='
      reverse: '='
    templateUrl: 'directives/button_group.html'
    link: (scope, element, attrs) ->
      scope.setOrder = (arg) ->
        if scope.order == arg
          scope.reverse = !scope.reverse
        else
          scope.reverse = false
          scope.order = arg

      scope.sort = (term) ->
        scope.order != term

      scope.sortDesc = (term) ->
        scope.order == term && !scope.reverse

      scope.sortAsc = (term) ->
        scope.order == term && scope.reverse
