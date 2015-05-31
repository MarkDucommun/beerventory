@beerventory.controller 'BeerController', (
  $scope,
  $routeParams,
  $location,
  Beer
) ->

  $scope.setTab('beers')

  $scope.beer = null

  $scope.editing = false

  $scope.pop = ->
    $scope.editing = true
    console.log('POP')

  Beer.find($routeParams.id).then (beer) ->
    $scope.beer = beer

  $scope.afterBeerSave = ->
    $scope.editing = false

  $scope.deleteBeer =  ->
    $scope.beer.delete().then (deletedBeer) ->
      $location.path('/beers')
