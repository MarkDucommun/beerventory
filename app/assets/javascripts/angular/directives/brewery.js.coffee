@beerventory.directive 'brewery', ->
  restrict: 'E'
  scope:
    brewery: '=instance'
    delete: '&'
  templateUrl: 'directives/brewery.html'
  link: (scope, element, attrs) ->
    scope.notEditing = true
    scope.editing = false

    scope.edit = ->
      scope.editing = true
      scope.notEditing = false

    scope.cancel = ->
      scope.editing = false
      scope.notEditing = true

    scope.afterSave = (brewery) ->
      scope.editing = false
      scope.notEditing = true
      scope.brewery = brewery
