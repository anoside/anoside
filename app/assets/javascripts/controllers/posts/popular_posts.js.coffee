Anoside.PopularPostsCtrl = ($scope, $http, $translate) ->
  $http.get('/api/discovery/posts/popular').success (data) ->
    posts = data.posts
    posts[posts.length - 1]['last'] = true
    $scope.posts = posts


Anoside.PopularPostsCtrl.$inject = ['$scope', '$http', '$translate']
