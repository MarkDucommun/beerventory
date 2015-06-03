@beerventory.controller 'BreweriesController', (
  $scope,
  Brewery
) ->

  $scope.setTab('breweries')

  $scope.breweries = []

  Brewery.index().then (breweries) ->
    $scope.breweries = breweries

  $scope.setOrder = (arg) ->
    if $scope.order == arg
      $scope.reverse = !$scope.reverse
    else
      $scope.reverse = false
      $scope.order = arg

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
