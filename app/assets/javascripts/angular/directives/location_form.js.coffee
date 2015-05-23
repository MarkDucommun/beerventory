@beerventory.directive 'locationForm', (
  Validations
) ->
  restrict: 'E'
  scope:
    location: '='
    afterSave: '&'
  templateUrl: 'directives/location_form.html'
  link: (scope, element, attrs) ->
    scope.$watch 'location', ->
      alert('ERROR: NOT A LOCATION') if scope.location.constructor.name != 'Location'

    scope.$watch 'locationForm', ->
      scope.containerFns = Validations.createFns scope.locationForm.container, [
        'required'
        'valid'
        'invalid'
      ]

      scope.roomFns = Validations.createFns scope.locationForm.room, [
        'required'
        'valid'
        'invalid'
      ]

    scope.saveLocationForm = ->
      scope.location.save().then (location) ->
        scope.afterSave(location: location)
      scope.locationForm.$setPristine()
