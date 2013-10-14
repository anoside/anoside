Anoside.PostsCtrl = ($scope, $http, postService) ->
  $http.get('/api/posts.json').success (data) ->
    $scope.posts = data.posts

  $scope.$on 'handleBroadcast', ->
    $scope.posts.unshift(postService.post)
  
  $scope.postBodyTag = (post) ->
    bodyElm = $('<div class="body">')

    unless _.isNull(post.deleted_at)
      bodyElm.addClass('deleted')

    bodyElm.html(post.body)[0].outerHTML

  $scope.deletePost = (post) ->
    if confirm('Are you sure?')
      $http.delete("/api/posts/#{post.id}").success ->
        location.href = '/'


Anoside.PostsCtrl.$inject = ['$scope', '$http', 'postService']
