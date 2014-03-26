ffAppService = angular.module("ffAppService", ["ngResource"])

ffAppService.factory "Api", ($resource) ->
    Posts: $resource("/posts.json", {id: @id}, {'update': {method: 'PUT'}})
    PostDetail: $resource("/posts/:id.json", {id: @id}, {'update': {method: 'PUT'}})
    UserPostDetail: $resource("/users/:id.json", {id: @id}, {'update': {method: 'PUT'}})
    Tickets: $resource("/tickets.json", {id: @id}, {'update': {method: 'PUT'}})
    LogIn: $resource("/sessions.json", {email: @email, password: @password}, {'create': {method: 'POST', isArray: false}})