Anoside.TagPostsCtrl = ($scope, $http) ->
  $scope.$parent.$watch 'tag', (tag) ->
    if tag
      $http.get('/api/posts', params: { tag: tag.name }).success (data) ->
        $scope.posts = data.posts

  $scope.deletePost = (post) ->
    if confirm('Are you sure?')
      $http.delete("/api/posts/#{post.id}").success ->
        location.href = '/'


Anoside.TagPostsCtrl.$inject = ['$scope', '$http']
