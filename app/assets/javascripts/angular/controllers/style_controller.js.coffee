@beerventory.controller 'StyleController', (
  $scope,
  $location,
  $modal,
  $routeParams,
  Style
) ->

  $scope.setTab('styles')

  $scope.style = null

  $scope.editing = false
  $scope.modal = null

  $scope.edit = (value) ->
    $scope.editing = value

  Style.find($routeParams.id).then (style) ->
    $scope.style = style

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
