@beer.directive 'breweryForm', ->
  restrict: 'E'
  scope:
    brewery: '='
    afterSave: '&'
  templateUrl: 'directives/brewery_form.html'
  link: (scope, element, attrs) ->
    scope.$watch 'brewery', ->
      alert('ERROR: NOT A BREWERY') if scope.brewery.constructor.name != 'Brewery'

    scope.$watch 'breweryForm', ->
      scope.name =
        field: scope.breweryForm.name
        required: -> this.field.$dirty && this.field.$error.required

    scope.saveForm = ->
      scope.brewery.save().then (brewery) ->
        scope.afterSave(brewery: brewery)
      scope.breweryForm.$setPristine()
