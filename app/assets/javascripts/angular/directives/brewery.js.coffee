@beer.directive 'brewery', ->
  restrict: 'E'
  scope:
    brewery: '=instance'
    delete: '&'
  templateUrl: 'directives/brewery.html'
  link: (scope, element, attrs) ->
    scope.notEditting = true
    scope.editting = false

    scope.edit = ->
      scope.editting = true
      scope.notEditting = false

    scope.cancel = ->
      scope.editting = false
      scope.notEditting = true

    scope.afterSave = (brewery) ->
      scope.editting = false
      scope.notEditting = true
      scope.brewery = brewery
