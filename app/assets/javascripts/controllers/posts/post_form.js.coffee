Anoside.PostFormCtrl = ($scope, $http, postService) ->
  $scope.focus = ->
    $scope.formFocused = true
  
  $scope.unforcus = ->
    $scope.formFocused = false
    $scope.post.body = ''

  $scope.create = (post) ->
    $http.post('/api/posts', post).success (data) ->
      postService.prependPost(data)
      post.body = ''

  $scope.expand = ($event) ->
    $($event.target).height(140)


Anoside.PostFormCtrl.$inject = ['$scope', '$http', 'postService']
