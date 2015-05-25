@beerventory = angular.module 'beerventory', [
  'ngResource'
  'ngRoute'
  'angular-underscore'
  'templates'
  'ui.select'
]

@beerventory.config (
  $routeProvider,
  $locationProvider,
  uiSelectConfig
) ->

  # Handle Rails attempting to reload page
  $routeProvider.when '/',
    redirectTo: (current, path, search) ->
      if search.goto then search.goto else '/units'

  $routeProvider.when '/beers',
    templateUrl: 'views/beers.html'
    controller: 'BeersController'

  $routeProvider.when '/breweries',
    templateUrl: 'views/breweries.html'
    controller: 'BreweriesController'

  $routeProvider.when '/containers',
    templateUrl: 'views/containers.html'
    controller: 'ContainersController'

  $routeProvider.when '/locations',
    templateUrl: 'views/locations.html'
    controller: 'LocationsController'

  $routeProvider.when '/units',
    templateUrl: 'views/units.html'
    controller: 'UnitsController'

  $routeProvider.when '/units/:id',
    templateUrl: 'views/units.html'
    controller: 'UnitsController'

  $routeProvider.otherwise
    redirectTo: '/beers'

  $locationProvider.html5Mode(true)

  uiSelectConfig.theme = 'bootstrap'
