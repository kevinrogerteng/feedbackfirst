ffAppCtrl = angular.module("ffAppCtrl", [])

ffAppCtrl.controller("ffAppCtrl", ["$scope", "Api", "$location"
  ($scope, Api, $location) ->

    Api.Posts.query((data) ->
        $scope.posts = data
      )
    Api.Tickets.query((data) ->
        $scope.tickets = data
        $scope.max = $scope.tickets.length
      )
    $scope.isCollapsed = true
    

  ])

ffAppCtrl.controller("postShowDetail", ["$scope", "$routeParams", "Api",
  ($scope, $routeParams, Api) ->
    Api.PostDetail.query({"id":$routeParams.id}, (data)->
        $scope.post = data
      )
  ])

ffAppCtrl.controller("newPost", ["$scope", "Api", "$location", "AuthService"
  ($scope, Api, $location, AuthService) ->
    $scope.submitPost = ()->
      user = AuthService.getCurrentUser()
      post = {
        title: $scope.post.title
        description: $scope.post.description
        user_id : user.id
      }
      Api.Posts.save(post)
  ])
