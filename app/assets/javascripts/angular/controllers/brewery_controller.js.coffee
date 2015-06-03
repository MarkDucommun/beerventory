@beerventory.controller 'BreweryController', (
  $scope,
  $routeParams,
  Brewery
) ->

  $scope.setTab('breweries')

  $scope.brewery = null

  Brewery.find($routeParams.id).then (brewery) ->
    $scope.brewery = brewery
