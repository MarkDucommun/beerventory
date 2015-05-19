@beer.controller 'ContainersController', (
  $scope,
  Container
) ->

  $scope.containers = []

  Container.index().then (containers) ->
    $scope.containers = containers

  $scope.deleteContainer = (container) ->
    container.delete().then (deletedContainer) ->
      $scope.containers = _.without($scope.containers, _.findWhere($scope.containers, id: deletedContainer.id))
