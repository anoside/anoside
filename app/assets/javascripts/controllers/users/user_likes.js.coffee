Anoside.UserLikesCtrl = ($scope, $http) ->
  $scope.$parent.title = 'Likes'

  $http.get("/api/user/likes").success (data) ->
    $scope.posts = data.posts


Anoside.UserLikesCtrl.$inject = ['$scope', '$http']
