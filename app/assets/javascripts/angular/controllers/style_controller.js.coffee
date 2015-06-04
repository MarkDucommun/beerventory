@beerventory.controller 'StyleController', (
  $scope,
  $routeParams,
  Style
) ->

  $scope.setTab('styles')
  
  $scope.style = null
  
  $scope.editing = false
  
  $scope.edit = (value) ->
    $scope.editing = value
  
  Style.find($routeParams.id).then (style) ->
    $scope.style = style

  $scope.afterStyleSave = ->
    $scope.editing = false
