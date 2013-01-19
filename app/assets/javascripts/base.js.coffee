window.Anoside = {}

Anoside.module = angular.module('anoside', ['ngSanitize'])

Anoside.module.config(['$httpProvider', (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

Anoside.module.directive 'pressEnterKey', ($parse) ->
  (scope, elm, attr) ->
    elm.bind 'keypress', (event) ->
      if event.which == 13
        fn = $parse(attr.pressEnterKey)
        scope.$apply ->
          fn(scope, $event: event)
