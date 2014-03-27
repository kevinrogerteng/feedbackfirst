ffAppCtrl = angular.module("ffAppCtrl", [])

ffAppCtrl.controller("ffAppCtrl", ["$scope", "Api", "$location", "AuthService"
  ($scope, Api, $location, AuthService) ->

    Api.Posts.query((data) ->
        $scope.posts = data
      )
    Api.Tickets.query((data) ->
        $scope.tickets = data
        $scope.max = $scope.tickets.length
      )
    $scope.isCollapsed = true

  ])

ffAppCtrl.controller("postShowDetail", ["$scope", "$routeParams", "Api", "AuthService"
  ($scope, $routeParams, Api, AuthService) ->

    Api.PostDetail.query({"id":$routeParams.id}, (data)->
        $scope.post = data
      )

    $scope.updatePost = (post) ->
      Api.PostDetail.update("id": post.id, post)

    $scope.checkOwner = (post) ->
      $scope.currentUser = AuthService.getCurrentUser()
      if post.user_id is $scope.currentUser.id
        return true
      else
        return false

    Api.Tags.query((data)->
      $scope.tags = data
      )

    $scope.tagsChosen = {}

    $scope.submitGraph = () ->

      console.log("this works!")
      console.log($scope.graph.title)

      tagsChose = []
      angular.forEach($scope.tagsChosen, (checked, id)->
        if checked
          tagsChose.push($scope.tags[id])
        )
      console.log($scope.tagsChosen)
        # graph = {
        #   name: $scope.graph.name
        #   tags: tagsChose
        #   post_id: $routeParams.id
        # }
        # Api.newGraph.save(graph)
])

ffAppCtrl.controller("newPost", ["$scope", "Api", "$location", "AuthService"
  ($scope, Api, $location, AuthService) ->
    $scope.submitPost = ()->
      user = AuthService.getCurrentUser()
      post = {
        title: $scope.post.title
        description: $scope.post.description
        user_id: user.id
      }
      Api.Posts.save(post)
      $location.path("/users/" + user.id + "/posts")
  ])

ffAppCtrl.controller("userPosts", ['$scope', 'Api', '$routeParams'
  ($scope, Api, $routeParams) ->
    Api.UserPostDetail.query({"id": $routeParams.id}, (data) ->
        $scope.userPosts = data
      )

    Api.Tickets.query((data) ->
        $scope.tickets = data
        $scope.max = $scope.tickets.length
      )
    $scope.isCollapsed = true

  ])