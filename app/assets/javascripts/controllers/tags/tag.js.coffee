Anoside.TagCtrl = ($scope, $http) ->
  tagName = $('.tag').data('tag-name')

  $scope.$parent.title = tagName

  $http.get("/api/tags/#{tagName}").success (data) ->
    $scope.tag = data

  $scope.toggleFollow = ->
    if $scope.tag.followed
      $http.delete("/api/tags/#{tagName}/follow").success (data) ->
        $scope.tag = data
    else
      $http.post("/api/tags/#{tagName}/follow").success (data) ->
        $scope.tag = data


Anoside.TagCtrl.$inject = ['$scope', '$http']
