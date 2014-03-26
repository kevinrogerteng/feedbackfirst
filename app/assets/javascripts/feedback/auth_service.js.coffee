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




