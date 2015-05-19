@beerventory.controller 'UnitsController', (
  $scope,
  Unit
) ->

  $scope.units = []

  Unit.index().then (units) ->
    $scope.units = units

  $scope.deleteUnit = (unit) ->
    unit.delete().then (deletedUnit) ->
      $scope.units = _.without($scope.units, _.findWhere($scope.units, id: deletedUnit.id))
