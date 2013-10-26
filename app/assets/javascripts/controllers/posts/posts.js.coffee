Anoside.PostsCtrl = ($scope, $http, postService) ->
  $http.get('/api/posts').success (data) ->
    $scope.posts = data.posts

  $scope.$on 'handleBroadcast', ->
    $scope.posts.unshift(postService.post)
  
  $scope.deletePost = (post) ->
    if confirm('Are you sure?')
      $http.delete("/api/posts/#{post.id}").success ->
        location.href = '/'


Anoside.PostsCtrl.$inject = ['$scope', '$http', 'postService']
