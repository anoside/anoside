Anoside.LikesCtrl = ($scope, $http, postService) ->
  post = $scope.$parent.post

  $scope.toggleLike = ->
    if post.disliked
      destroyDislike()

    if post.liked
      destroyLike()
    else
      createLike()

  $scope.toggleDislike = ->
    if post.liked
      destroyLike()

    if post.disliked
    else
      createDislike()


  createLike = ->
    $http.post("/api/posts/#{post.id}/like").success (data) ->
      post.likes_count += 1
      post.liked = true

  destroyLike = ->
    $http.delete("/api/posts/#{post.id}/like").success (data) ->
      post.likes_count += -1
      post.liked = false

  createDislike = ->
    $http.post("/api/posts/#{post.id}/dislike").success (data) ->
      post.dislikes_count += 1
      post.disliked = true

  destroyDislike = ->
    $http.delete("/api/posts/#{post.id}/dislike").success (data) ->
      post.dislikes_count += -1
      post.disliked = false


Anoside.LikesCtrl.$inject = ['$scope', '$http']
