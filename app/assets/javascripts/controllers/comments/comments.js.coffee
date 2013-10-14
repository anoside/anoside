Anoside.CommentsCtrl = ($scope, $http) ->
  post = $scope.$parent.post

  $http.get("/api/posts/#{post.id}/comments").success (data) ->
    comments = data.comments.reverse()
    $scope.comments = comments.slice(0, 5).reverse()


Anoside.CommentsCtrl.$inject = ['$scope', '$http']
