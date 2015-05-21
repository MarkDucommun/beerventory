@beerventory.directive 'unitForm', (
  Validations,
  Beer,
  Container,
  Location
) ->
  restrict: 'E'
  scope:
    unit: '='
    afterSave: '&'
  templateUrl: 'directives/unit_form.html'
  link: (scope, element, attrs) ->
      scope.beers = []
      scope.containers = []
      scope.location = []

      Beer.index().then (beers) ->
        scope.beers = beers

      Container.index().then (containers) ->
        scope.containers = containers

      Location.index().then (locations) ->
        scope.locations = locations

      scope.$watch 'unit', ->
        alert('ERROR: NOT A UNIT') if scope.unit.constructor.name != 'Unit'

      scope.$watch 'unitForm', ->
        scope.beer =
          field: scope.unitForm.beer
          required: -> Validations.required(this.field)

        scope.container =
          field: scope.unitForm.container
          required: -> Validations.required(this.field)

      scope.saveForm = ->
        scope.unit.save().then (unit) ->
          scope.afterSave(unit: unit)
        scope.unitForm.$setPristine()
