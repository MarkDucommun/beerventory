@beerventory.controller 'NewUnitController', (
  $scope,
  Unit
) ->

  $scope.newUnit = Unit.new()

  $scope.afterSave = (unit) ->
    $scope.units.push(unit)
    $scope.newUnit = Unit.new()
