Anoside.UserDislikesCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.posts_i_dislike')

  $http.get("/api/user/dislikes").success (data) ->
    $scope.posts = data.posts


Anoside.UserDislikesCtrl.$inject = ['$scope', '$http', '$translate']
