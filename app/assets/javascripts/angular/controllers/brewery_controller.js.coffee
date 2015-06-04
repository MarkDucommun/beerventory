@beerventory.controller 'BreweryController', (
  $scope,
  $location,
  $modal,
  $routeParams,
  Brewery,
  Beer
) ->

  $scope.setTab('breweries')

  $scope.brewery = null
  $scope.beers = []

  $scope.editing = false
  $scope.modal = null

  Brewery.find($routeParams.id).then (brewery) ->
    $scope.brewery = brewery

  Beer.index(brewery_id: $routeParams.id).then (beers) ->
    $scope.beers = beers

  $scope.edit = (value) ->
    $scope.editing = value

  $scope.afterBrewerySave = ->
    $scope.editing = false

  $scope.deleteBrewery = ->
    $scope.brewery.delete().then (deleteBrewery) ->
      $location.path('/breweries')
      $scope.modal.close('deleted-brewery')

  $scope.openDeleteModal = ->
    $scope.modal = $modal.open
      templateUrl: 'modals/delete_brewery_confirmation.html'
      scope: $scope
      size: 'sm'

  $scope.closeDeleteModal = ->
    $scope.modal.dismiss('cancel')

  $scope.reverse = false
  $scope.order = 'name'

  $scope.buttons = [
    {
      label: 'Name'
      term: 'name'
    }
    {
      label: 'Style'
      term: 'style.name'
    }
  ]
