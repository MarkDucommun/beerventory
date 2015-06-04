@beerventory.controller 'StyleController', (
  $scope,
  $location,
  $modal,
  $routeParams,
  Beer,
  Style
) ->

  $scope.setTab('styles')

  $scope.style = null
  $scope.beers = []

  $scope.editing = false
  $scope.modal = null

  Style.find($routeParams.id).then (style) ->
    $scope.style = style

  Beer.index(style_id: $routeParams.id).then (beers) ->
    $scope.beers = beers

  $scope.edit = (value) ->
    $scope.editing = value

  $scope.afterStyleSave = ->
    $scope.editing = false

  $scope.deleteStyle = ->
    $scope.style.delete().then (deletedStyle) ->
      $location.path('/styles')
      $scope.modal.close('deleted-style')

  $scope.openDeleteModal = ->
    $scope.modal = $modal.open
      templateUrl: 'modals/delete_style_confirmation.html'
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
      label: 'Brewery'
      term: 'brewery.name'
    }
  ]
