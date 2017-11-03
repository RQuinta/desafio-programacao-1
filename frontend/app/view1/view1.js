'use strict';

angular.module('myApp.view1', ['ngRoute'])

.config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/view1', {
    templateUrl: 'view1/view1.html',
    controller: 'View1Ctrl'
  });
}])

.controller('View1Ctrl', ['$scope', 'fileUpload', function($scope, fileUpload) {

  $scope.uploadFile = function(){
    var file = $scope.myFile;
    var uploadUrl = "http://0.0.0.0:9292/api/v1/sells/mass_edit";
    var promise = fileUpload.uploadFileToUrl(file, uploadUrl);
    promise.success(function(data){
      $scope.sells = data;
    })
    .error(function(response){
      alert("Ops!!! Algum problema na importação do arquivo")
    });
  };

  $scope.sellsSum = function(){
    return $scope.sells.reduce(function(acc, sell) {
      return (sell.item.price * sell.count) + acc;
    }, 0);
  }

}]);
