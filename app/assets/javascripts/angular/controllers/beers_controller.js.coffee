@beerventory.controller 'BeersController', (
  $scope,
  Beer
) ->

  $scope.setTab('beers')

  $scope.beers = []

  $scope.newBeer = Beer.new()

  Beer.index().then (beers) ->
    $scope.beers = beers

  $scope.reverse = false
  $scope.order = 'name'

  $scope.setOrder = (arg) ->
    if $scope.order == arg
      $scope.reverse = !$scope.reverse
    else
      $scope.reverse = false
      $scope.order = arg

  $scope.deleteBeer = (beer) ->
    beer.delete().then (deletedBeer) ->
      $scope.beers = _.without($scope.beers, _.findWhere($scope.beers, id: deletedBeer.id))

  $scope.afterSave = (beer) ->
    $scope.beers.push(beer)
    $scope.newBeer = Beer.new()
