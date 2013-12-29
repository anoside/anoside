Anoside.LatestPostsCtrl = ($scope, $http, $translate) ->
  $http.get('/api/posts/latest').success (data) ->
    posts = data.posts
    posts[posts.length - 1]['last'] = true
    $scope.posts = posts


Anoside.LatestPostsCtrl.$inject = ['$scope', '$http', '$translate']
