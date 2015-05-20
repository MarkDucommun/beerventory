@beerventory.directive 'container', ->
  restrict: 'E'
  scope:
    container: '=instance'
    delete: '&'
  templateUrl: 'directives/container.html'
  link: (scope, element, attrs) ->
    scope.notEditing = true
    scope.editing = false

    scope.edit = ->
      scope.editing = true
      scope.notEditing = false

    scope.cancel = ->
      scope.editing = false
      scope.notEditing = true

    scope.afterSave = (container) ->
      scope.editing = false
      scope.notEditing = true
      scope.container = container
