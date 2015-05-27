@beerventory.controller 'StylesController', (
  $scope,
  Style
) ->

  $scope.styles = []

  Style.index().then (styles) -> $scope.styles = styles

  $scope.setTab('styles')
