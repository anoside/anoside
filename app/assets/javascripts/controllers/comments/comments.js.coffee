Anoside.CommentsCtrl = ($scope, $http) ->
  post = $scope.$parent.post

  $http.get("/api/posts/#{post.id}/comments").success (data) ->
    $scope.comments = data.comments


Anoside.CommentsCtrl.$inject = ['$scope', '$http']
