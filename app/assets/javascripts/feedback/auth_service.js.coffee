authService = angular.module("auth", [])

authService.service("AuthService", [
  ()->
    @userIsAuthenticated = false
    @currentUser = {}

    @setUserAuthenticated = (value, user) ->
      @userIsAuthenticated = value
      @currentUser = user
    
    @getUserAuthenticated = () ->
      @userIsAuthenticated

    @getCurrentUser = () ->
      @currentUser
    return
  ])

logInService = angular.module("logIn", [])

logInService.controller('LogInCtrl', ['$scope', 'Api', '$location', 'AuthService'
  ($scope, Api, $location, AuthService) ->
    $scope.isTrue = true

    if AuthService.getUserAuthenticated()
      $location.path("/posts")

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




