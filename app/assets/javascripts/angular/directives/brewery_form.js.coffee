@beerventory.directive 'breweryForm', (
  Validations
) ->
  restrict: 'E'
  scope:
    brewery: '='
    afterSave: '&'
  templateUrl: 'directives/brewery_form.html'
  link: (scope, element, attrs) ->
    scope.$watch 'brewery', ->
      alert('ERROR: NOT A BREWERY') if scope.brewery.constructor.name != 'Brewery'

    scope.$watch 'breweryForm', ->
      scope.nameFns = Validations.createFns scope.breweryForm.name, [
        'required'
        'valid'
        'invalid'
      ]

      scope.cityFns = Validations.createFns scope.breweryForm.city, [
        'valid'
        'invalid'
      ]

      scope.stateFns = Validations.createFns scope.breweryForm.state, [
        'valid'
        'invalid'
      ]

    scope.saveBreweryForm = ->
      scope.brewery.save().then (brewery) ->
        scope.afterSave(brewery: brewery)
      scope.breweryForm.$setPristine()
