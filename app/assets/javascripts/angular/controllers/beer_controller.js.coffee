@beerventory.controller 'BeerController', (
  $scope,
  $routeParams,
  $location,
  Beer,
  Unit
) ->

  $scope.setTab('beers')

  $scope.beer = null
  $scope.units = []

  $scope.editing = false

  $scope.edit = (value) ->
    $scope.editing = value

  Beer.find($routeParams.id).then (beer) ->
    $scope.beer = beer

  Unit.index(unit: {beer_id: $routeParams.id}, false).then (units) ->
    $scope.units = units

  $scope.afterBeerSave = ->
    $scope.editing = false

  $scope.deleteBeer =  ->
    $scope.beer.delete().then (deletedBeer) ->
      $location.path('/beers')
