Anoside.TagsFormCtrl = ($scope, $http) ->
  $scope.showForm = ->
    tags = $scope.$parent.post.tags
    $scope.tagList = _.pluck(tags, 'name').join(', ')
    $scope.showed = true

  $scope.create = ->
    postId = $scope.$parent.post.id

    $http.post("/api/posts/#{postId}/tags.json", { tag_list: $scope.tagList }).success (data) ->
      $scope.$parent.post.tags = data.tags
      $scope.showed = false


Anoside.TagsFormCtrl.$inject = ['$scope', '$http']
