@beerventory.directive 'unit', ->
  restrict: 'E'
  scope:
    unit: '=instance'
    delete: '&'
  templateUrl: 'directives/unit.html'
  link: (scope, element, attrs) ->
    scope.notEditting = true
    scope.editting = false

    scope.edit = ->
      scope.editting = true
      scope.notEditting = false

    scope.cancel = ->
      scope.editting = false
      scope.notEditting = true

    scope.afterSave = (unit) ->
      scope.editting = false
      scope.notEditting = true
      scope.unit = unit
