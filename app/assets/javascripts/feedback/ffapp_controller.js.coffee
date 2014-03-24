ffAppCtrl = angular.module("ffAppCtrl", [])

ffAppCtrl.controller("ffAppCtrl", ["$scope", "Api",
  ($scope, Api) ->

    Api.Posts.query((data) ->
        $scope.posts = data
        console.log($scope.posts)
      )
    Api.Tickets.query((data) ->
        $scope.tickets = data
      )
  ])

# ffAppCtrl.controller("postShowDetail", ["$scope", "$routeParams", "$http",
#   ($scope, $routeParams, $http) ->
#     PostId = 

#   ])
