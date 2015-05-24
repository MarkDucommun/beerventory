@beerventory.controller 'UnitsController', (
  $scope,
  $routeParams,
  Unit
) ->

  $scope.units = []

  Unit.index().then (units) -> $scope.units = units

  $scope.setTab('units')

  if $routeParams.id
    Unit.find($routeParams.id).then (unit) ->
      $scope.unit = unit
  else
    $scope.unit = Unit.new()

  $scope.newUnit = -> $scope.unit = Unit.new()

  $scope.editUnit = (unit) -> $scope.unit = unit

  $scope.deleteUnit = (unit) ->
    unit.delete().then (deletedUnit) ->
      $scope.units = _.without($scope.units, _.findWhere($scope.units, id: deletedUnit.id))

  $scope.afterSave = (unit) ->
    $scope.units.push(unit)
    $scope.unit = Unit.new()
