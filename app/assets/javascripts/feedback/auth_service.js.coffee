authService = angular.module("auth", [])

authService.service("AuthService", [
  ()->
    @userIsAuthenticated = true
    @currentUser = {id: 1, name: "Kevin Roger Teng", email: "kevin@gmail.com"}

    @setUserAuthenticated = (value, user) ->
      @userIsAuthenticated = value
      return @currentUser = user
    
    @getUserAuthenticated = () ->
      return @userIsAuthenticated

    @getCurrentUser = () ->
      return @currentUser
    return
  ])




