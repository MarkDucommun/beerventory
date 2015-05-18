@beer.controller 'NewBreweryController', (
  $scope,
  Brewery
) ->

  $scope.newBrewery = Brewery.new()

  $scope.afterSave = (brewery) ->
    $scope.newBrewery = Brewery.new()
