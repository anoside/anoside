Anoside.DiscoveryCtrl = ($scope, $http) ->
  $http.get('/api/discovery/tags/popular').success (data) ->
    $scope.tags = data.tags


Anoside.DiscoveryCtrl.$inject = ['$scope', '$http']
