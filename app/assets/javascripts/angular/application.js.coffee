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

  $locationProvider.html5Mode(false);
