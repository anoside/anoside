Anoside.PostCtrl = ($scope, $http) ->
  postId = $('.post').data('post-id')

  $http.get("/api/posts/#{postId}").success (data) ->
    # I wrote this ugry code because `$scope.post = data` causes that
    # `timeAgo` attribute become null in timeAgo directive.
    $scope.posts = [data]

  $scope.deletePost = (post) ->
    if confirm('Are you sure?')
      $http.delete("/api/posts/#{post.id}").success ->
        location.href = '/'


Anoside.PostCtrl.$inject = ['$scope', '$http']
