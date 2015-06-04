@beerventory.directive 'styleForm', (
  Validations,
  Style
) ->
  restrict: 'E'
  scope:
    style: '='
    afterSave: '&'
  templateUrl: 'directives/style_form.html'
  link: (scope, element, attrs) ->
    scope.$watch 'style', ->
      alert('ERROR: NOT A STYLE') if scope.style and scope.style.constructor.name != 'Style'

    scope.$watch 'styleForm', ->
      scope.nameFns = Validations.createFns scope.styleForm.name, [
        'required'
        'valid'
        'invalid'
      ]

    scope.saveStyleForm = ->
      scope.style.save().then (style) ->
        scope.afterSave(style: style)
      scope.styleForm.$setPristine(true)
      scope.styleForm.$setUntouched(true)
