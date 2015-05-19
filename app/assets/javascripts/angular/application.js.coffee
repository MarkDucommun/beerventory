@beerventory = angular.module 'beerventory', [
  'ngResource',
  'ngRoute',
  'angular-underscore',
  'templates'
]

@beerventory.config (
  $routeProvider,
  $locationProvider
) ->

  # Handle Rails attempting to reload page
  $routeProvider.when '/',
    redirectTo: (current, path, search) ->
      if search.goto then search.goto else '/beers'

  $routeProvider.when '/beers',
    templateUrl: 'views/beers.html'
    controller: 'BeersController'

  $routeProvider.when '/breweries',
    templateUrl: 'views/breweries.html'
    controller: 'BreweriesController'

  $routeProvider.when '/containers',
    templateUrl: 'views/containers.html'
    controller: 'ContainersController'

  $routeProvider.otherwise
    redirectTo: '/beers'

  $locationProvider.html5Mode(true);
