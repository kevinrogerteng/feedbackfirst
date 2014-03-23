ffApp = angular.module("ffApp", ["ngResource", "ffAppRouter"])

ffApp.controller("ffAppCtrl", ["$scope", "Api",
  ($scope, Api) ->
    $scope.message = "hello world!"
    Api.Posts.query((data) ->
        $scope.posts = data
      )
    Api.Tickets.query((data) ->
        $scope.tickets = data
      )
  ])

ffAppRouter = angular.module("ffAppRouter", ["ngRoute"])

ffAppRouter.config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider.when("/", {templateUrl: "/posts", controller: "ffAppCtrl"})
  ])

ffApp.config(["$httpProvider",($httpProvider)->
     $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
])

ffApp.factory "Api", ($resource) ->
    Posts: $resource("/posts.json", {id: @id}, {'update': {method: 'PUT'}})
    Tickets: $resource("/tickets.json", {id: @id}, {'update': {method: 'PUT'}})
