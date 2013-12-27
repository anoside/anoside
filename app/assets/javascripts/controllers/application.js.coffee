Anoside.ApplicationCtrl = ($scope, $http) ->
  $scope.title = 'Anoside'

  $('.dropdown-toggle').dropdown()
  $('.dropdown').on 'show.bs.dropdown', ->
    if $(window).height() < 400
      $('.dropdown-menu').css
        height: '300px'
        overflowY: 'scroll'

Anoside.ApplicationCtrl.$inject = ['$scope', '$http']
