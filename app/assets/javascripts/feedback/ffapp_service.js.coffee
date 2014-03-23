ffAppService = angular.module("ffAppService", ["ngResource"])

ffAppService.factory "Api", ($resource) ->
    Posts: $resource("/posts.json", {id: @id}, {'update': {method: 'PUT'}})
    Tickets: $resource("/tickets.json", {id: @id}, {'update': {method: 'PUT'}})
