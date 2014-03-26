navBar = angular.module("navBar", [])

navBar.controller("navBarCtrl", ['$scope', 'AuthService', '$rootScope'
  ($scope, AuthService) ->
    $scope.userAuth = AuthService.getUserAuthenticated()
    console.log($scope.userAuth)
    $scope.checkUser = ()-> 
      $scope.user = AuthService.getCurrentUser()
      return AuthService.getUserAuthenticated()
])