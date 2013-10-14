Anoside.TagsCtrl = ($scope, $http) ->
  post = $scope.$parent.post

  $http.get("/api/posts/#{post.id}/tags").success (data) ->
    $scope.tags = data.tags


Anoside.TagsCtrl.$inject = ['$scope', '$http']
