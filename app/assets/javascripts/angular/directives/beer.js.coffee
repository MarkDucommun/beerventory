@beerventory.directive 'beer', ->
  restrict: 'E'
  scope:
    beer: '=instance'
    delete: '&'
  templateUrl: 'directives/beer.html'
  link: (scope, element, attrs) ->
    scope.notEditing = true
    scope.editing = false

    scope.edit = ->
      scope.editing = true
      scope.notEditing = false

    scope.cancel = ->
      scope.editing = false
      scope.notEditing = true

    scope.afterSave = (beer) ->
      scope.editing = false
      scope.notEditing = true
      scope.beer = beer
