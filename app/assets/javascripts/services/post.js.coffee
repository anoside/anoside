Anoside.angular.factory 'postService', ($rootScope) ->
  post: ''
  prependPost: (post) ->
    @post = post
    $rootScope.$broadcast('handleBroadcast')
