@beer = angular.module 'beerventory', [
  'ngResource',
  'ngRoute',
  'angular-underscore',
  'templates'
]

@beer.config (
  $routeProvider,
  $locationProvider
) ->

  $routeProvider.when '/beers',
    templateUrl: 'views/beers.html'
    controller: 'BeersController'

  $routeProvider.when '/breweries',
    templateUrl: 'views/breweries.html'
    controller: 'BreweriesController'

  $routeProvider.otherwise
    redirectTo: '/beers'

  $locationProvider.html5Mode(false);
