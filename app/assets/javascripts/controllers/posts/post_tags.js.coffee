Anoside.PostTagsCtrl = ($scope, $http) ->
  post = $scope.$parent.post

  $http.get("/api/posts/#{post.id}/tags").success (data) ->
    $scope.tags = data.tags


Anoside.PostTagsCtrl.$inject = ['$scope', '$http']
