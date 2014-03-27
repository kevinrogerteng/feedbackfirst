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
    $scope.message = "hello"

    $scope.updatePost = (post) ->
      Api.PostDetail.update("id": post.id, post)

    $scope.checkOwner = (post) ->
      $scope.currentUser = AuthService.getCurrentUser()
      if post.user_id is $scope.currentUser.id
        return true
      else
        return false

    $scope.chartType = 'pie';

    $scope.config1 = {
      labels: false,
      title : "Products",
      legend : {
        display:true,
        position:'right'
      }
    }
])

ffAppCtrl.controller("newPost", ["$scope", "Api", "$location", "AuthService", "$http"
  ($scope, Api, $location, AuthService, $http) ->

    Api.Tags.query((data)->
      $scope.tags = data
      )

    $scope.tagsChosen = {}

    $scope.submitPost = ()->
      user = AuthService.getCurrentUser()
      post = {
        title: $scope.post.title
        description: $scope.post.description
        user_id: user.id
      }

      graph = {
          name: $scope.graph.title
        }



      Api.Posts.save(post, (data)->
        graph = {
          name:$scope.graph.title
          post_id: data.id
        }
        Api.newGraph.save(graph, (data)->
          tagsChose = []
          angular.forEach($scope.tagsChosen, (checked, id)->
            if checked
              tagsChose.push($scope.tags[id])
            )
          $http.put("/graphs/" + data.id + ".json", tags: tagsChose)
          )
          # Api.GraphDetails.update("id": data.id, "tags": tags)
        ) 
      # $location.path("/users/" + user.id + "/posts")

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