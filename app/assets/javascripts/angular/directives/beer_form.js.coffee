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
      scope.name =
        required: -> Validations.required(scope.beerForm.name)

      scope.brewery =
        required: -> Validations.required(scope.beerForm.brewery)

    scope.saveBeerForm = ->
      scope.beer.save().then (beer) ->
        scope.afterSave(beer: beer)
      scope.beerForm.$setPristine

    scope.afterNewBrewerySave = (brewery) ->
      scope.breweries.push(brewery)
      scope.beer.brewery = brewery
      scope.makeNewBrewery = false
      scope.newBrewery = Brewery.new()
