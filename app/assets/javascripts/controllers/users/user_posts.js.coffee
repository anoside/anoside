Anoside.UserPostsCtrl = ($scope, $http) ->
  $scope.$parent.title = 'Me'

  $http.get("/api/user/posts").success (data) ->
    $scope.posts = data.posts


Anoside.UserPostsCtrl.$inject = ['$scope', '$http']
