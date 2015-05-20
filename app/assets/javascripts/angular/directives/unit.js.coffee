@beerventory.directive 'unit', ->
  restrict: 'E'
  scope:
    unit: '=instance'
    delete: '&'
  templateUrl: 'directives/unit.html'
  link: (scope, element, attrs) ->
    scope.notEditing = true
    scope.editing = false

    scope.edit = ->
      scope.editing = true
      scope.notEditing = false

    scope.cancel = ->
      scope.editing = false
      scope.notEditing = true

    scope.afterSave = (unit) ->
      scope.editing = false
      scope.notEditing = true
      scope.unit = unit
