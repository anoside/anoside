Anoside.UserTagsCtrl = ($scope, $http) ->
  $http.get("/api/user/tags").success (data) ->
    $scope.tags = data.tags


Anoside.UserTagsCtrl.$inject = ['$scope', '$http']
