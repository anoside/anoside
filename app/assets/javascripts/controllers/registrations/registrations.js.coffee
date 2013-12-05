Anoside.RegistrationsCtrl = ($scope, $translate) ->
  $scope.$parent.title = $translate('titles.sign_up')
  $scope.$parent.backUrl = '/'

Anoside.RegistrationsCtrl.$inject = ['$scope', '$translate']
