@beer.controller 'BreweriesController', (
  $scope,
  Brewery
) ->

  $scope.breweries = []

  Brewery.index().then (breweries) ->
    $scope.breweries = breweries


  $scope.deleteBrewery = (brewery) ->
    brewery.delete().then (deletedBrewery) ->
      $scope.breweries = _.without($scope.breweries, _.findWhere($scope.breweries, id: deletedBrewery.id))
