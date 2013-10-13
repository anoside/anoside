Anoside.CommentsCtrl = ($scope, $http) ->
  $scope.create = (comment, postId) ->
    $http.post("/api/posts/#{postId}/comments", comment).success (data) ->
      comments = $scope.$parent.post.comments
      comments.shift()
      comments.push(data)

      $scope.$parent.post.comments = comments
      $scope.comment = ''

  $scope.expand = ($event) ->
    $($event.target).height(100)


Anoside.CommentsCtrl.$inject = ['$scope', '$http']
