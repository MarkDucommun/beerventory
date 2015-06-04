@beerventory.controller 'BreweriesController', (
  $scope,
  Brewery
) ->

  $scope.setTab('breweries')

  $scope.breweries = []

  Brewery.index().then (breweries) ->
    $scope.breweries = breweries

  $scope.reverse = false
  $scope.order = 'name'

  $scope.buttons = [
    {
      label: 'Name'
      term: 'name'
    }
    {
      label: 'City'
      term: 'city'
    }
    {
      label: 'State'
      term: 'state'
    }
  ]
