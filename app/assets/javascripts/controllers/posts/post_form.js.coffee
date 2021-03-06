Anoside.PostFormCtrl = ($scope, $http, postService) ->
  $scope.bodyCount = 300
  $scope.countOver = false
  $scope.didPost = false

  $scope.focus = ->
    $scope.formFocused = true
  
  $scope.unforcus = ->
    $scope.formFocused = false
    $scope.post.body = ''
    $scope.countDownBody()

  $scope.countDownBody = ($event) ->
    $scope.bodyCount = 300 - $scope.post.body.length
    $scope.countOver = $scope.bodyCount < 0

  $scope.create = (post) ->
    $scope.didPost = true
    $http.post('/api/posts', post).success (data) ->
      postService.prependPost(data)
      post.body = ''
      $scope.countDownBody()
      $scope.didPost = false

  $scope.expand = ($event) ->
    $($event.target).height(140)


Anoside.PostFormCtrl.$inject = ['$scope', '$http', 'postService']
