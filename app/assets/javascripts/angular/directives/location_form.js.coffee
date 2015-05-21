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
      scope.container =
        field: scope.locationForm.container
        required: -> Validations.required(this.field)

      scope.room = ->
        field: scope.locationForm.room
        required: -> Validations.required(this.field)

    scope.saveForm = ->
      scope.location.save().then (location) ->
        scope.afterSave(location: location)
      scope.locationForm.$setPristine()
