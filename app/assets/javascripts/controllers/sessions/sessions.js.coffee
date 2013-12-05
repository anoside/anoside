Anoside.SessionsCtrl = ($scope, $translate) ->
  $scope.$parent.title = $translate('titles.sign_in')
  $scope.$parent.backUrl = '/'

Anoside.SessionsCtrl.$inject = ['$scope', '$translate']
