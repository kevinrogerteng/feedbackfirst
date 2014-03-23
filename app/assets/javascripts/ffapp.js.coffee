ffApp = angular.module("ffApp", ["ngResource", "ffAppRouter"])

ffApp.controller("ffAppCtrl", ["$scope", "PostEntry",
  ($scope, PostEntry) ->
    $scope.message = "hello world!"
    PostEntry.query((data) ->
        console.log(data)
        $scope.posts = data.posts
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

ffApp.factory "PostEntry", ($resource) ->
    $resource("/posts.json", {id: @id}, {'update': {method: 'PUT'}}, {'query': {method: 'GET', isArray:false}})

