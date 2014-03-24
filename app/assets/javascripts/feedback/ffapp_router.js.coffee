ffAppRouter = angular.module("ffAppRouter", ["ngRoute"])

ffAppRouter.config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider.when("/"
      templateUrl: "/posts"
      controller: "ffAppCtrl"
    )
    .when("/posts/:id"
      templateUrl: "/posts/show"
      controller: "postShowDetail"
    )
  ])

