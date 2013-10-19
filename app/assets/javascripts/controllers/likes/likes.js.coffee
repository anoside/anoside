Anoside.LikesCtrl = ($scope, $http, postService) ->
  post = $scope.$parent.post

  $scope.toggleLike = ->
    if post.liked
      $http.delete("/api/posts/#{post.id}/like").success (data) ->
        post.likes_count += -1
        post.liked = false
    else
      $http.post("/api/posts/#{post.id}/like").success (data) ->
        post.likes_count += 1
        post.liked = true


Anoside.LikesCtrl.$inject = ['$scope', '$http']
