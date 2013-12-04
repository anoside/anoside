Anoside.DiscoveryTagsCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.discover')
  $scope.$parent.backUrl = '/'

  $http.get('/api/discovery/tags/popular').success (data) ->
    $scope.tags = data.tags


Anoside.DiscoveryTagsCtrl.$inject = ['$scope', '$http', '$translate']
