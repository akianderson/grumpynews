'use strict';

angular.module('angularApp')
  .controller('MainCtrl', function ($scope, $resource) {
    $scope.show = false;

    $scope.feeds = $resource("/api/feeds.json").query();

    $scope.getClass = function(index) {
      if(index % 4 == 0){
        return 'box-blue';
      } else if (index % 3 == 0){
        return 'box-green';
      } else if (index % 2 == 0){
        return 'box-green';
      } else {
        return 'box-pink';
      }
    }
  });
