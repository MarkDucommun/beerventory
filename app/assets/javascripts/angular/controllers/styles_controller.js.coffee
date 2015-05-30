@beerventory.controller 'StylesController', (
  $scope,
  Style
) ->

  $scope.styles = []

  Style.index().then (styles) -> $scope.styles = styles

  $scope.setTab('styles')

  $scope.newStyle = Style.new()

  $scope.afterSave = (style) ->
    $scope.styles.push(style)
    $scope.newStyle = Style.new()
