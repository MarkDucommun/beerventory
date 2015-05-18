@beer.controller 'NewBeerController', (
  $scope,
  Beer
) ->

  $scope.newBeer = Beer.new()

  $scope.afterSave = (beer) ->
    $scope.beers.push(beer)
    $scope.newBeer = Beer.new()
