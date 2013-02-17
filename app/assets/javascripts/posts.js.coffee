Anoside.module.factory 'postService', ($rootScope) ->
  post: ''
  prependPost: (post) ->
    @post = post
    $rootScope.$broadcast('handleBroadcast')


Anoside.PostFormCtrl = ($scope, $http, postService) ->
  $scope.create = (post) ->
    $http.post('/api/posts.json', post).success (data) ->
      postService.prependPost(data)

  $scope.expand = ($event) ->
    $($event.target).height(140)


Anoside.PostsCtrl = ($scope, $http, postService) ->
  $http.get('/api/posts.json').success (data) ->
    $scope.posts = data

  $scope.$on 'handleBroadcast', ->
    $scope.posts.unshift(postService.post)
  
  $scope.postBodyTag = (post) ->
    bodyElm = $('<div class="body">')

    unless _.isNull(post.deleted_at)
      bodyElm.addClass('deleted')

    bodyElm.html(post.body)[0].outerHTML

  $scope.isOwnPost = (post) ->
    (Anoside.currentUser.id == post.user_id) && _.isNull(post.deleted_at)

  $scope.deletePost = (post) ->
    message = Anoside.i18n.messages.areYouSure
 
    if confirm(message)
      $http.delete("/api/posts/#{post.id}.json").success ->
        location.href = '/'


Anoside.PostFormCtrl.$inject = ['$scope', '$http', 'postService']
Anoside.PostsCtrl.$inject = ['$scope', '$http', 'postService']
