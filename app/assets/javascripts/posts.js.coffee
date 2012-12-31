Anoside.PostFormController = ($scope, $http) ->
  $scope.create = (post) ->
    $http.post('/api/posts.json', post).success (data) ->
      console.log(data)
      $scope.posts = data

Anoside.PostsCtrl = ($scope, $http) ->
  $http.get('/api/posts.json').success (data) ->
    $scope.posts = data
