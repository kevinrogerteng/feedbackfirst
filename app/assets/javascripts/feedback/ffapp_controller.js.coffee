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

    dateSinceTime = Date.now()

    $scope.dateToday = Date.create(dateSinceTime).format("{MM}/{dd}/{yy}")

  ])

ffAppCtrl.controller("postShowDetail", ["$scope", "$routeParams", "Api", "AuthService"
  ($scope, $routeParams, Api, AuthService) ->

    tagData = []

    Api.PostDetail.query({"id":$routeParams.id}, (data)->
        $scope.post = data
        angular.forEach($scope.post, (post)->
          $scope.graph = post.graph
          tags = post.graph.tags
          angular.forEach(tags, (tag)->
            tagData.push({"x": tag.name, "y":[tag.tickets.length]})
            )
          )
      )
    $scope.data = {
          data : tagData
        }

    $scope.chartType = 'pie';

    $scope.config1 = {
      labels: false
      legend : {
        display:true,
        position:'right'
      }
    }

    $scope.updatePost = (post) ->
      Api.PostDetail.update("id": post.id, post)

    $scope.checkOwner = (post) ->
      $scope.currentUser = AuthService.getCurrentUser()
      if post.user_id is $scope.currentUser.id
        return true
      else
        return false

    $scope.updateGraph = (graph) ->
      newGraph = {
        name: graph.name
        post_id: graph.post_id
      }
      Api.GraphDetail.update("id": graph.id, newGraph)

    $scope.createNew = (graph) ->
      # graph creation goes here
      
])

ffAppCtrl.controller("newPost", ["$scope", "Api", "$location", "AuthService", "$http"
  ($scope, Api, $location, AuthService, $http) ->

    Api.Tags.query((data)->
      $scope.tags = data
      )

    Api.Categories.query((data)->
      $scope.categories = data
      )

    $scope.graph = {}
    $scope.post = {}

    $scope.tagsChosen = {}
    $scope.tagsChose = []

    $scope.submitPost = ()->
      user = AuthService.getCurrentUser()
      post = {
        title: $scope.post.title
        description: $scope.post.description
        user_id: user.id
      }

      angular.forEach($scope.tagsChosen, (checked, index)->
          if checked 
            $scope.tagsChose.push($scope.tags[index])
          )

      Api.Posts.save(post, (data)->
        graph = {
          name:$scope.graph.title
          post_id: data.id
          tags: $scope.tagsChose
        }
        Api.Graph.save(graph, (data)->
          $location.path("/users/" + user.id + "/posts")
          )
        )    
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
