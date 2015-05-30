@beerventory.directive 'beerForm', (
  Validations,
  Brewery,
  Style
) ->
  restrict: 'E'
  scope:
    beer: '='
    afterSave: '&'
  templateUrl: 'directives/beer_form.html'
  link: (scope, element, attrs) ->
    scope.makeNewBrewery = false
    scope.makeNewStyle = false

    scope.breweries = []
    scope.styles = []

    scope.newBrewery = Brewery.new()
    scope.newStyle = Style.new()

    Brewery.index().then (breweries) ->
      scope.breweries = breweries

    Style.index().then (styles) ->
      scope.styles = styles

    scope.$watch 'beer', ->
      alert('ERROR: NOT A BEER') if scope.beer.constructor.name != 'Beer'

    scope.$watch 'beerForm', ->
      scope.nameFns = Validations.createFns scope.beerForm.name, [
        'required'
        'valid'
        'invalid'
      ]

      scope.breweryFns = Validations.createFns scope.beerForm.brewery, [
        'required'
        'valid'
        'invalid'
      ]

      scope.styleFns = Validations.createFns scope.beerForm.style, [
        'valid'
        'invalid'
      ]

    scope.saveBeerForm = ->
      scope.beer.save().then (beer) ->
        scope.afterSave(beer: beer)
      scope.beerForm.$setPristine(true)
      scope.beerForm.$setUntouched(true)

    scope.afterNewBrewerySave = (brewery) ->
      scope.breweries.push(brewery)
      scope.beer.brewery = brewery
      scope.makeNewBrewery = false
      scope.newBrewery = Brewery.new()
      scope.$watch 'beerForm', ->
        scope.beerForm.brewery.$setTouched(true)

    scope.afterNewStyleSave = (style) ->
      scope.styles.push(style)
      scope.beer.style = style
      scope.makeNewStyle = false
      scope.newStyle = Style.new()
      scope.$watch 'styleForm', ->
        scope.beerForm.style.$setTouched(true)
