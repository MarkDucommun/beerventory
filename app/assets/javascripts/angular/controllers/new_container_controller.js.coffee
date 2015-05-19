@beer.controller 'NewContainerController', (
  $scope,
  Container
) ->

  $scope.newContainer = Container.new()

  $scope.afterSave = (container) ->
    $scope.containers.push(container)
    $scope.newContainer = Container.new()
