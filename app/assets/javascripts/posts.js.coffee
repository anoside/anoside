Anoside.module.factory 'postService', ($rootScope) ->
  post: ''
  prependPost: (post) ->
    @post = post
    $rootScope.$broadcast('handleBroadcast')


Anoside.PostFormCtrl = ($scope, $http, postService) ->
  $scope.create = (post) ->
    $http.post('/api/posts.json', post).success (data) ->
      postService.prependPost(data)


Anoside.PostsCtrl = ($scope, $http, postService) ->
  $http.get('/api/posts.json').success (data) ->
    $scope.posts = data

  $scope.$on 'handleBroadcast', ->
    $scope.posts.unshift(postService.post)


Anoside.PostFormCtrl.$inject = ['$scope', '$http', 'postService']
Anoside.PostsCtrl.$inject = ['$scope', '$http', 'postService']
