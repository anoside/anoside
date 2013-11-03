Anoside.UserDislikesCtrl = ($scope, $http) ->
  $scope.$parent.title = 'Dislikes'

  $http.get("/api/user/dislikes").success (data) ->
    $scope.posts = data.posts


Anoside.UserDislikesCtrl.$inject = ['$scope', '$http']
