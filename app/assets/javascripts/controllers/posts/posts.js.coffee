Anoside.PostsCtrl = ($scope, $http, postService, $translate) ->
  $scope.$parent.title = $translate('titles.timeline')
  $scope.$parent.backUrl = '/' if location.pathname == '/timeline'
  page = 1
  $scope.disabled = false

  $http.get('/api/posts').success (data) ->
    $scope.posts = data.posts

  $scope.$on 'handleBroadcast', ->
    $scope.posts.unshift(postService.post)
  
  $scope.deletePost = (post) ->
    if confirm('Are you sure?')
      $http.delete("/api/posts/#{post.id}").success ->
        location.href = '/'

  $scope.addMorePosts = ->
    $scope.disabled = true
    page += 1

    $http.get("/api/posts?page=#{page}").success (data) ->
      if data.posts.length > 0
        $scope.disabled = false
        $scope.posts = $scope.posts.concat(data.posts)
      else
        $scope.disabled = true


Anoside.PostsCtrl.$inject = ['$scope', '$http', 'postService', '$translate']
