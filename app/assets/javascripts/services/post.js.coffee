Anoside.angular.factory 'postService', ($rootScope) ->
  prependPost: (post) ->
    @post = post
    $rootScope.$broadcast('handleBroadcast')
