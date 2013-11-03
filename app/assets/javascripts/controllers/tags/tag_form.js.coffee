Anoside.TagFormCtrl = ($scope, $http) ->
  $scope.showForm = ->
    tags = $scope.$parent.tags
    $scope.tagList = _.pluck(tags, 'name').join(', ')
    $scope.showed = true

  $scope.hideForm = ->
    $scope.showed = false

  $scope.create = ->
    postId = $scope.$parent.post.id

    $http.post("/api/posts/#{postId}/tags", { tag_list: $scope.tagList }).success (data) ->
      $scope.$parent.tags = data.tags
      $scope.showed = false


Anoside.TagFormCtrl.$inject = ['$scope', '$http']
