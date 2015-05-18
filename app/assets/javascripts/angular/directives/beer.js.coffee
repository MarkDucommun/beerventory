@beer.directive 'beer', ->
  restrict: 'E'
  scope:
    beer: '=instance'
    delete: '&'
  templateUrl: 'directives/beer.html'
  link: (scope, element, attrs) ->
    scope.notEditting = true
    scope.editting = false

    scope.edit = ->
      scope.editting = true
      scope.notEditting = false

    scope.cancel = ->
      scope.editting = false
      scope.notEditting = true

    scope.afterSave = (beer) ->
      scope.editting = false
      scope.notEditting = true
      scope.beer = beer
