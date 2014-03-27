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

    $scope.data = {
      series: ['Sales', 'Income', 'Expense', 'Laptops', 'Keyboards'],
      data : [{
        x : "Sales",
        y: [100,500, 0],
        tooltip:"this is tooltip"
      },
      {
        x : "Not Sales",
        y: [300, 100, 100]
      },
      {
        x : "Tax",
        y: [351]
      },
      {
        x : "Not Tax",
        y: [54, 0, 879]
      }]     
  }

    $scope.data1 = {
      data : [{
        x : "sign_in",
        y: [500],
        tooltip:"this is tooltip"
      },
      {
        x : "password_reset",
        y: [123]
      },
      {
        x : "mailing_list",
        y: [351]
      },
      {
        x : "Accounts",
        y: [879]
      }]     
    }

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