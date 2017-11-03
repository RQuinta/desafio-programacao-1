'use strict';

// Declare app level module which depends on views, and components
var app = angular.module('myApp', [
  'ngRoute',
  'angular-oauth2',
  'myApp.view1',
  'myApp.view2'
]);

app.config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
  $locationProvider.hashPrefix('!');

  $routeProvider.otherwise({redirectTo: '/view1'});
}]);

app.config(['OAuthProvider', function(OAuthProvider) {
  OAuthProvider.configure({
    baseUrl: 'http://localhost:9292/api/',
    clientId: 'CLIENT_ID',
  });
}]);
