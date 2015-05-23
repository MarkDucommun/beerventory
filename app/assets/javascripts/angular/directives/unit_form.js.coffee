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
      scope.makeNewBeer = false
      scope.makeNewContainer = false
      scope.makeNewLocation = false

      scope.beers = []
      scope.containers = []
      scope.location = []

      scope.newBeer = Beer.new()
      scope.newContainer = Container.new()
      scope.newLocation = Location.new()

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
          required: -> Validations.required(scope.unitForm.beer)

        scope.container =
          required: -> Validations.required(scope.unitForm.container)

      scope.afterNewBeerSave = (beer) ->
        scope.beers.push(beer)
        scope.unit.beer = beer
        scope.makeNewBeer = false
        scope.newBeer = Beer.new()

      scope.afterNewContainerSave = (container) ->
        scope.containers.push(container)
        scope.unit.container = container
        scope.makeNewContainer = false
        scope.newContainer = Container.new()

      scope.afterNewLocationSave = (location) ->
        scope.locations.push(location)
        scope.unit.location = location
        scope.makeNewLocation = false
        scope.newLocation = Location.new()

      scope.saveUnitForm = ->
        scope.unit.save().then (unit) ->
          scope.afterSave(unit: unit)
        scope.unitForm.$setPristine()
