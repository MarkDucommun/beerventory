@beerventory.controller 'ContainersController', (
  $scope,
  $location,
  $modal,
  $routeParams,
  Container
) ->

  $scope.setTab('containers')

  $scope.containers = []
  $scope.container = null
  $scope.modal = null

  Container.index().then (containers) ->
    $scope.containers = containers

  if $routeParams.id
    Container.find($routeParams.id).then (container) ->
      $scope.container = container
  else
    $scope.container = Container.new()

  $scope.afterContainerSave = (container) ->
    $scope.containers.push(container)
    $scope.container = Container.new()

  $scope.deleteContainer = (container) ->
    container.delete().then (deletedContainer) ->
      $scope.modal.close('deleted-container')
      $location.path('/containers')

  $scope.openDeleteModal = ->
    $scope.modal = $modal.open
      templateUrl: 'modals/delete_container_confirmation.html'
      scope: $scope
      size: 'sm'

  $scope.closeDeleteModal = ->
    $scope.modal.dismiss('cancel')
