@beerventory.controller 'UnitsController', (
  $scope,
  Unit
) ->

  $scope.setTab('units')

  $scope.units = []

  $scope.unit = Unit.new()

  Unit.index().then (units) ->
    $scope.units = units

  $scope.newUnit = -> $scope.unit = Unit.new()

  $scope.editUnit = (unit) -> $scope.unit = unit

  $scope.deleteUnit = (unit) ->
    unit.delete().then (deletedUnit) ->
      $scope.units = _.without($scope.units, _.findWhere($scope.units, id: deletedUnit.id))

  $scope.afterSave = (unit) ->
    $scope.units.push(unit)
    $scope.unit = Unit.new()
