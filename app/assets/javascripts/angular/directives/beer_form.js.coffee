@beerventory.directive 'beerForm', (
  Validations
) ->
  restrict: 'E'
  scope:
    beer: '='
    afterSave: '&'
  templateUrl: 'directives/beer_form.html'
  link: (scope, element, attrs) ->
      scope.$watch 'beer', ->
        alert('ERROR: NOT A BEER') if scope.beer.constructor.name != 'Beer'

      scope.$watch 'beerForm', ->
        scope.name =
          field: scope.beerForm.name
          required: -> Validations.required(this.field)

      scope.saveForm = ->
        scope.beer.save().then (beer) ->
          scope.afterSave(beer: beer)
        scope.beerForm.$setPristine()
