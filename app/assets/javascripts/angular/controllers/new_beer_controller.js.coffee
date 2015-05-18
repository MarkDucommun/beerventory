@beer.controller 'NewBeerController', (
  $scope,
  Beer
) ->

  $scope.newBeer = Beer.new()

  $scope.saveNewBeer = ->
    $scope.newBeer.save().then (beer) ->
      $scope.beers.push(beer)
      $scope.newBeer = Beer.new()
