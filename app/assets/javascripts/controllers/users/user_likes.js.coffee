Anoside.UserLikesCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.posts_i_like')

  $http.get("/api/user/likes").success (data) ->
    $scope.posts = data.posts


Anoside.UserLikesCtrl.$inject = ['$scope', '$http', '$translate']
