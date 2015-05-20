@beerventory.controller 'NewBeerController', (
  $scope,
  Beer
) ->

  $scope.newBeer = Beer.new()

  $scope.afterSave = (beer) ->
    $scope.newBeer = Beer.new()
