logInService = angular.module("logIn", [])

logInService.controller('LogInCtrl', ['$scope', 'Api', '$location', 'AuthService'
  ($scope, Api, $location, AuthService) ->
    $scope.user = AuthService.getCurrentUser()

    $scope.attemptLogin = ()->
      Api.LogIn.create({'email':$scope.credentials.email, 'password':$scope.credentials.password}, (data)->
        if (data.error)
          $scope.error = data.error
          AuthService.userIsAuthenticated = false
        else
          AuthService.setUserAuthenticated(true, data)
          $location.path("/")
        )
])