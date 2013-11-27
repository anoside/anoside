Anoside.UserPostsCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.me')

  $http.get("/api/user/posts").success (data) ->
    $scope.posts = data.posts


Anoside.UserPostsCtrl.$inject = ['$scope', '$http', '$translate']
