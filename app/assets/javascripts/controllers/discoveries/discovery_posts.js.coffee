Anoside.DiscoveryPostsCtrl = ($scope, $http, $translate) ->
  $scope.$parent.title = $translate('titles.discover')
  $scope.$parent.backUrl = '/'

  $http.get('/api/discovery/posts/popular').success (data) ->
    $scope.posts = data.posts


Anoside.DiscoveryPostsCtrl.$inject = ['$scope', '$http', '$translate']

