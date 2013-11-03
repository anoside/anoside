Anoside.ApplicationCtrl = ($scope, $http) ->
  $scope.title = 'Anoside'

  $('.dropdown-toggle').dropdown()

Anoside.ApplicationCtrl.$inject = ['$scope', '$http']
