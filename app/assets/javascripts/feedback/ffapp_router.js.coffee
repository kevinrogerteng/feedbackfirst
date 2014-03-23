ffAppRouter = angular.module("ffAppRouter", ["ngRoute"])

ffAppRouter.config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider.when("/", {templateUrl: "/posts", controller: "ffAppCtrl"})
  ])