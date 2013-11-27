Anoside.UserTagsCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.following_tags')

  $http.get("/api/user/tags").success (data) ->
    $scope.tags = data.tags


Anoside.UserTagsCtrl.$inject = ['$scope', '$http', '$translate']
