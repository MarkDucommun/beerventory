@beerventory.controller 'BeerController', (
  $scope,
  $routeParams,
  $modal,
  $location,
  Beer,
  Unit,
) ->

  $scope.setTab('beers')

  $scope.beer = null
  $scope.units = []

  $scope.editing = false
  $scope.modal = null

  $scope.edit = (value) ->
    $scope.editing = value

  Beer.find($routeParams.id).then (beer) ->
    $scope.beer = beer

  Unit.index(beer_id: $routeParams.id, false).then (units) ->
    $scope.units = units

  $scope.afterBeerSave = ->
    $scope.editing = false

  $scope.deleteBeer =  ->
    $scope.beer.delete().then (deletedBeer) ->
      $location.path('/beers')
      $scope.modal.close('deleted-beer')

  $scope.openDeleteModal = ->
    $scope.modal = $modal.open
      templateUrl: 'modals/delete_beer_confirmation.html'
      scope: $scope
      size: 'sm'

  $scope.closeDeleteModal = ->
    $scope.modal.dismiss('cancel')
