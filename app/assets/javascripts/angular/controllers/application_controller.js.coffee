@beerventory.controller 'ApplicationController', (
  $scope
) ->

  $scope.tab = null

  $scope.setTab = (tab) -> $scope.tab = tab

  $scope.tabIs = (tab) -> $scope.tab == tab
