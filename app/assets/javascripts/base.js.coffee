window.Anoside = {}

Anoside.module = angular.module('anoside', ['ngSanitize'])

Anoside.module.config(['$httpProvider', (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
