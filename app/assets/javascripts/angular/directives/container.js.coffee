@beer.directive 'container', ->
  restrict: 'E'
  scope:
    container: '=instance'
    delete: '&'
  templateUrl: 'directives/container.html'
  link: (scope, element, attrs) ->
    scope.notEditting = true
    scope.editting = false

    scope.edit = ->
      scope.editting = true
      scope.notEditting = false

    scope.cancel = ->
      scope.editting = false
      scope.notEditting = true

    scope.afterSave = (container) ->
      scope.editting = false
      scope.notEditting = true
      scope.container = container
