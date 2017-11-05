'use strict';

angular.module('myApp').service('fileUpload', ['$http', function ($http) {

  this.uploadFileToUrl = function(file, uploadUrl){
    var fd = new FormData();
    fd.append('file', file);
    fd.append('filetype', 'tab');
    fd.append('f', 'json');
    return $http({
      url: uploadUrl,
      method: 'POST',
      data: fd,
      headers: { 'Content-Type': undefined, 'charset': 'UTF-8'},
      transformRequest: angular.identity
    });
  }

}]);
