Anoside.DiscoveryPostsCtrl = ($scope, $http, $translate) ->
  $http.get('/api/discovery/posts/popular').success (data) ->
    $scope.posts = data.posts


Anoside.DiscoveryPostsCtrl.$inject = ['$scope', '$http']

