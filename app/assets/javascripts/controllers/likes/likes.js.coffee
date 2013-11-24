Anoside.LikesCtrl = ($scope, $http) ->
  @resource = @resourceName = null

  $scope.setResource = (resourceName) ->
    @resourceName = resourceName

    @resource = if resourceName == 'posts'
      $scope.$parent.post
    else if resourceName == 'comments'
      $scope.$parent.comment

  $scope.toggleLike = ->
    if @resource.disliked
      $scope._destroyDislike()

    if @resource.liked
      $scope._destroyLike()
    else
      $scope._createLike()

  $scope.toggleDislike = ->
    if @resource.liked
      $scope._destroyLike()

    if @resource.disliked
      $scope._destroyDislike()
    else
      $scope._createDislike()


  $scope._createLike = ->
    $http.post("/api/#{@resourceName}/#{@resource.id}/like").success (data) =>
      @resource.likes_count += 1
      @resource.liked = true

  $scope._destroyLike = ->
    $http.delete("/api/#{@resourceName}/#{@resource.id}/like").success (data) =>
      @resource.likes_count += -1
      @resource.liked = false

  $scope._createDislike = ->
    $http.post("/api/#{@resourceName}/#{@resource.id}/dislike").success (data) =>
      @resource.dislikes_count += 1
      @resource.disliked = true

  $scope._destroyDislike = ->
    $http.delete("/api/#{@resourceName}/#{@resource.id}/dislike").success (data) =>
      @resource.dislikes_count += -1
      @resource.disliked = false


Anoside.LikesCtrl.$inject = ['$scope', '$http']
