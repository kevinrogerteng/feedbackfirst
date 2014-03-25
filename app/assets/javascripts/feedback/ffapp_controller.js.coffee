ffAppCtrl = angular.module("ffAppCtrl", [])

ffAppCtrl.controller("ffAppCtrl", ["$scope", "Api",
  ($scope, Api) ->

    Api.Posts.query((data) ->
        $scope.posts = data
      )
    Api.Tickets.query((data) ->
        $scope.tickets = data
        $scope.max = $scope.tickets.length
      )

    $scope.isCollapsed = true
    $scope.progressValue = (data) ->
      return data.tickets.length
    $scope.newPost = () ->
      console.log("something!")
  ])

ffAppCtrl.controller("postShowDetail", ["$scope", "$routeParams", "Api",
  ($scope, $routeParams, Api) ->
    Api.PostDetail.query({"id":$routeParams.id}, (data)->
        $scope.post = data
        console.log(data)
      )
  ])
