Anoside.DiscoveryCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.discover')

  $http.get('/api/discovery/tags/popular').success (data) ->
    $scope.tags = data.tags


Anoside.DiscoveryCtrl.$inject = ['$scope', '$http', '$translate']
