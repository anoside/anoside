Anoside.CommentFormCtrl = ($scope, $http) ->
  $scope.bodyCount = 300
  $scope.countOver = false

  $scope.countDownBody = ($event) ->
    $scope.bodyCount = 300 - $scope.comment.body.length
    $scope.countOver = $scope.bodyCount < 0

  $scope.create = (comment, postId) ->
    $http.post("/api/posts/#{postId}/comments", comment).success (data) ->
      $scope.$parent.comments.push(data)
      $scope.comment.body = ''
      $scope.countDownBody()

  $scope.expand = ($event) ->
    $($event.target).height(100)


Anoside.CommentFormCtrl.$inject = ['$scope', '$http']
