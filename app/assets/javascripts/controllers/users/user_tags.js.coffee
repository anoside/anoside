Anoside.UserTagsCtrl = ($scope, $http) ->
  $scope.$parent.title = 'Tags'

  $http.get("/api/user/tags").success (data) ->
    $scope.tags = data.tags


Anoside.UserTagsCtrl.$inject = ['$scope', '$http']
