@beerventory.directive 'beerForm', (
  Validations,
  Brewery
) ->
  restrict: 'E'
  scope:
    beer: '='
    afterSave: '&'
  templateUrl: 'directives/beer_form.html'
  link: (scope, element, attrs) ->
    scope.breweries = []
    scope.makeNewBrewery = false
    scope.newBrewery = Brewery.new()

    Brewery.index().then (breweries) ->
      scope.breweries = breweries

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
