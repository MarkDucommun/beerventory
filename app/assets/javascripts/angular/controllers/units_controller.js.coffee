@beerventory.controller 'UnitsController', (
  $scope,
  $routeParams,
  $location,
  $modal,
  Unit
) ->

  $scope.units = []
  $scope.modal = null

  Unit.index().then (units) -> $scope.units = units

  $scope.setTab('units')

  if $routeParams.id
    Unit.find($routeParams.id).then (unit) ->
      $scope.unit = unit
  else
    $scope.unit = Unit.new()

  # TODO currently not removing from localCollection I think
  $scope.deleteUnit = ->
    $scope.unit.delete().then (deletedUnit) ->
      $scope.units = _.filter $scope.units, (unit) ->
        unit.id != deletedUnit.id
      $scope.modal.close('deleted-unit')
      $location.path('/units')

  $scope.afterSave = (unit) ->
    $scope.units.push(unit)
    $scope.unit = Unit.new()

  $scope.openDeleteModal = ->
    $scope.modal = $modal.open
      templateUrl: 'modals/delete_unit_confirmation.html'
      scope: $scope
      size: 'sm'

  $scope.closeDeleteModal = ->
    $scope.modal.dismiss('cancel')
