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

  $routeProvider.otherwise({redirectTo: '/credentials'});
}]);

app.config(['OAuthProvider', function(OAuthProvider) {
  OAuthProvider.configure({
    name: 'token',
    options: {
      secure: true
    },
    baseUrl: '/api/',
    clientId: 'sadfsdfasfsfasdfasfasdf',
    grantPath: '/oauth/token',
    revokePath: '/oauth/revoke'
  });
}]);

app.run(['$rootScope', '$window', 'OAuth', function($rootScope, $window, OAuth) {
  $rootScope.$on('oauth:error', function(event, rejection) {

    if ('invalid_token' === rejection.data.error) {
      return OAuth.getRefreshToken();
    }

  });
}]);

app.run(['$location', 'OAuth','$cookies', function($location, OAuth, $cookies) {
  if (OAuth.isAuthenticated()) {
    $location.url('/upload_planilha');
  }
}]);
