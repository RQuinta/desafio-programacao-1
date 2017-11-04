'use strict';

angular.module('myApp.view2', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/credentials', {
    templateUrl: 'view2/view2.html',
    controller: 'View2Ctrl'
  });
}])

.controller('View2Ctrl', ['$scope', 'OAuth', '$location', '$http', function($scope, OAuth, $location, $http ) {

  $scope.login = function() {
    var promise  = OAuth.getAccessToken($scope.user);
    promise.then(function (result) {
      $location.url('/view1');
    })
  };

  $scope.createUser = function(){
    $http({
      url: '/api/v1/users',
      method: 'POST',
      data: $scope.user,
    }).then(function(result){
      var promise  = OAuth.getAccessToken($scope.user);
      promise.then(function () {
        $location.url('/upload_planilha');
      });
    });
  };

}]);
