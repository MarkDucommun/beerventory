@beer.controller 'BreweriesController', (
  $scope,
  Brewery
) ->

  $scope.breweries = []

  Brewery.index().then (breweries) ->
    $scope.breweries = breweries
