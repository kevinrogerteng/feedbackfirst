ffAppService = angular.module("ffAppService", ["ngResource"])

ffAppService.factory "Api", ($resource) ->
    Posts: $resource("/posts.json", {id: @id}, {'update': {method: 'PATCH'}})
    Categories: $resource("/categories.json")
    Tags: $resource("/tags.json")
    Graph: $resource("/graphs.json", {id: @id}, {'update': {method: 'PATCH'}})
    GraphDetail: $resource("/graphs/:id.json", {id: @id}, {'update': {method: 'PATCH'}})
    PostDetail: $resource("/posts/:id.json", {id: @id}, {'update': {method: 'PATCH'}})
    UserPostDetail: $resource("/users/:id.json", {id: @id}, {'update': {method: 'PATCH'}})
    Tickets: $resource("/tickets.json", {id: @id}, {'update': {method: 'PATCH'}})
    LogIn: $resource("/sessions.json", {email: @email, password: @password}, {'create': {method: 'POST', isArray: false}})