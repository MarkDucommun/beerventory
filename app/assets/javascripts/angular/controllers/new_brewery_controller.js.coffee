@beerventory.controller 'NewBreweryController', (
  $scope,
  Brewery
) ->

  $scope.newBrewery = Brewery.new()

  $scope.afterSave = (brewery) ->
    $scope.breweries.push(brewery)
    $scope.newBrewery = Brewery.new()
