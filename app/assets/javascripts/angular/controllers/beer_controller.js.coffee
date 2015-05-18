@beer.controller 'BeerController', (
  $scope,
  Beer
) ->

  $scope.beers = []

  Beer.index().then (beers) ->
    $scope.beers = beers

  $scope.deleteBeer = (beer) ->
    beer.delete().then (deletedBeer) ->
      $scope.beers = _.without($scope.beers, _.findWhere($scope.beers, id: deletedBeer.id))
