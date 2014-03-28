ffAppRouter = angular.module("ffAppRouter", ["ngRoute"])

ffAppRouter.config(["$routeProvider",
  ($routeProvider) ->
    $routeProvider.when("/posts/new"
      templateUrl: "/posts/new"
      controller: "newPost"
    ).when("/"
      templateUrl: "/posts"
      controller: "ffAppCtrl"
    )
    .when("/posts/:id"
      templateUrl: "/posts/show"
      controller: "postShowDetail"
    )
    .when("/sessions/new"
      templateUrl: "/sessions/new"
      controller: "LogInCtrl"
    )
    .when("/users/:id/posts"
      templateUrl: "/users/show"
      controller: "userPosts"
    )
  ])

