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
    Brewery.index().then (breweries) ->
      scope.breweries = breweries

    scope.$watch 'beer', ->
      alert('ERROR: NOT A BEER') if scope.beer.constructor.name != 'Beer'

    scope.$watch 'beerForm', ->
      scope.name =
        field: scope.beerForm.name
        required: -> Validations.required(this.field)

      scope.brewery =
        field: scope.beerForm.brewery
        required: -> Validations.required(this.field)

    scope.saveForm = ->
      scope.beer.save().then (beer) ->
        scope.afterSave(beer: beer)
      scope.beerForm.$setPristine
