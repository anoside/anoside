Anoside.TagCtrl = ($scope, $http) ->
  tagName = $('.tag').data('tag-name')

  $http.get("/api/tags/#{tagName}").success (data) ->
    $scope.tag = data


Anoside.TagCtrl.$inject = ['$scope', '$http']
