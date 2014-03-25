authService = angular.module("auth", [])

authService.service("AuthService", 
  ()->
    userIsAuthenticated = false
    this.setUserAuthenticated = (value) ->
      userIsAuthenticated = value

    this.getUserAuthenticated = ()->
      return userIsAuthenticated
  )

logInService = angular.module("logIn", ["auth"])

logInService.controller('LogInCtrl', ['$scope', 'Api', 'AuthService', '$location'
  ($scope, Api, AuthService, $location) ->

    if AuthService.getUserAuthenticated
      $location.path("/posts")

    $scope.attemptLogin = ()->
      Api.LogIn.create({'email':$scope.credentials.email, 'password':$scope.credentials.password}, (data)->
        if (data.error)
          $scope.error = data.error
        else
          AuthService.setUserAuthenticated(true)
          $scope.user = data
          console.log($scope.user)
        )
])



