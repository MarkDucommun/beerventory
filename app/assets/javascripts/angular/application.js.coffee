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
    templateUrl: 'views/beer.html'
    controller: 'BeerController'

  $locationProvider.html5Mode(false);
