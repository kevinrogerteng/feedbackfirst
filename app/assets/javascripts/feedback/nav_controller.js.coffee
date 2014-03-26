navBar = angular.module("navBar", [])

navBar.controller("navBarCtrl", ['$scope', 'AuthService', '$rootScope'
  ($scope, AuthService) ->
    $scope.userAuth = AuthService.getUserAuthenticated()
    $scope.checkUser = ()-> 
      $scope.user = {id: 1, name: "Kevin Roger Teng", email: "kevin@gmail.com"}
      return true
      # $scope.user = AuthService.getCurrentUser()
      # return AuthService.getUserAuthenticated()
])