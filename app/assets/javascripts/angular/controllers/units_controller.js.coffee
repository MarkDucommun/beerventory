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

  $scope.reverse = false
  $scope.order = 'beer.name'

  $scope.setOrder = (arg) ->
    if $scope.order == arg
      $scope.reverse = !$scope.reverse
    else
      $scope.reverse = false
      $scope.order = arg

  $scope.deleteUnit = (unit) ->
    unit.delete().then (deletedUnit) ->
      $scope.units = _.without($scope.units, _.findWhere($scope.units, id: deletedUnit.id))

  $scope.afterSave = (unit) ->
    $scope.units.push(unit)
    $scope.unit = Unit.new()
