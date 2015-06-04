@beerventory = angular.module 'beerventory', [
  'ngResource'
  'ngRoute'
  'angular-underscore'
  'templates'
  'ui.select'
  'ui.bootstrap'
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

  $routeProvider.when '/beer/:id',
    templateUrl: 'views/beer.html'
    controller: 'BeerController'

  $routeProvider.when '/breweries',
    templateUrl: 'views/breweries.html'
    controller: 'BreweriesController'

  $routeProvider.when '/brewery/:id',
    templateUrl: 'views/brewery.html'
    controller: 'BreweryController'

  $routeProvider.when '/containers',
    templateUrl: 'views/containers.html'
    controller: 'ContainersController'

  $routeProvider.when '/containers/:id',
    templateUrl: 'views/containers.html'
    controller: 'ContainersController'

  $routeProvider.when '/locations',
    templateUrl: 'views/locations.html'
    controller: 'LocationsController'

  $routeProvider.when '/styles',
    templateUrl: 'views/styles.html'
    controller: 'StylesController'

  $routeProvider.when '/style/:id',
    templateUrl: 'views/style.html'
    controller: 'StyleController'

  $routeProvider.when '/units',
    templateUrl: 'views/units.html'
    controller: 'UnitsController'

  $routeProvider.when '/units/:id',
    templateUrl: 'views/units.html'
    controller: 'UnitsController'

  $routeProvider.otherwise
    redirectTo: '/units'

  $locationProvider.html5Mode(true)

  uiSelectConfig.theme = 'bootstrap'
