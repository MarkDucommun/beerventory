@beerventory.controller 'BreweryController', (
  $scope,
  $routeParams,
  Brewery,
  Beer
) ->

  $scope.setTab('breweries')

  $scope.brewery = null
  $scope.beers = []

  Brewery.find($routeParams.id).then (brewery) ->
    $scope.brewery = brewery

  Beer.index(brewery_id: $routeParams.id).then (beers) ->
    $scope.beers = beers
