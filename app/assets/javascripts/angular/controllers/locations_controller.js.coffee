@beerventory.controller 'LocationsController', (
  $scope,
  Location
) ->

  $scope.locations = []

  Location.index().then (locations) ->
    $scope.locations = locations

  $scope.deleteLocation = (location) ->
    location.delete().then (deletedLocation) ->
      $scope.locations = _.without($scope.locations, _.findWhere($scope.locations, id: deletedLocation.id))
