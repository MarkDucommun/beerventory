@beerventory.directive 'unitForm', (
  Validations,
  Beer,
  Container,
  Location,
  Unit
) ->
  restrict: 'E'
  scope:
    unit: '='
    afterSave: '&'
  templateUrl: 'directives/unit_form.html'
  link: (scope, element, attrs) ->
      scope.quantity = 1

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
        alert('ERROR: NOT A UNIT') if scope.unit && scope.unit.constructor.name != 'Unit'

      scope.$watch 'unitForm', ->
        scope.beerFns = Validations.createFns scope.unitForm.beer, [
          'required'
          'valid'
          'invalid'
        ]

        scope.containerFns = Validations.createFns scope.unitForm.container, [
          'required'
          'valid'
          'invalid'
        ]

        scope.locationFns = Validations.createFns scope.unitForm.location, [
          'valid'
          'invalid'
        ]

        scope.bottlingDateFns = Validations.createFns scope.unitForm.bottling_date, [
          'valid'
          'invalid'
        ]

        scope.purchaseDateFns = Validations.createFns scope.unitForm.purchase_date, [
          'valid'
          'invalid'
        ]

        scope.bestByDateFns = Validations.createFns scope.unitForm.best_by_date, [
          'valid'
          'invalid'
        ]

        scope.quantityFns = Validations.createFns scope.unitForm.quantity, [
          'required'
          'number'
          'min'
          'max'
          'valid'
          'invalid'
        ]

        scope.noteFns = Validations.createFns scope.unitForm.note, [
          'valid'
          'invalid'
        ]

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
        if scope.unit.id
          scope.unit.save()
        else
          scope.newUnits = []
          dupUnit = _.extend({}, scope.unit)
          _.each [1..scope.quantity], ->
            _.extend({}, dupUnit).save().then (unit) ->
              scope.newUnits.push(unit)
              scope.afterSave(unit: unit)
          scope.showNewIdentifiers = true
        scope.unitForm.$setPristine()

      scope.showNewIdentifiers = false

      scope.dismissIdentifiers = ->
        scope.showNewIdentifiers = false
        scope.newUnits = []
