@beerventory.controller 'NewLocationController', (
  $scope,
  Location
) ->

  $scope.newLocation = Location.new()

  $scope.afterSave = (location) ->
    $scope.locations.push(location)
    $scope.newLocation = Location.new()
