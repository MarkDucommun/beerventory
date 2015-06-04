@beerventory.controller 'BeersController', (
  $scope,
  Beer
) ->

  $scope.setTab('beers')

  $scope.beers = []

  $scope.newBeer = Beer.new()

  Beer.index().then (beers) ->
    $scope.beers = beers

  $scope.afterBeerSave = (beer) ->
    $scope.beers.push(beer)
    $scope.newBeer = Beer.new()

  $scope.reverse = false
  $scope.order = 'name'

  $scope.buttons = [
    {
      label: 'Name'
      term: 'name'
    }
    {
      label: 'Brewery'
      term: 'brewery.name'
    }
    {
      label: 'Style'
      term: 'style.name'
    }
  ]
