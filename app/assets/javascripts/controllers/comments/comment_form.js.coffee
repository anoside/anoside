Anoside.CommentFormCtrl = ($scope, $http) ->
  $scope.create = (comment, postId) ->
    $http.post("/api/posts/#{postId}/comments", comment).success (data) ->
      $scope.$parent.comments.push(data)
      $scope.comment = ''

  $scope.expand = ($event) ->
    $($event.target).height(100)


Anoside.CommentFormCtrl.$inject = ['$scope', '$http']
