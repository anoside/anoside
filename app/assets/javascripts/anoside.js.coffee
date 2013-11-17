window.Anoside = {}

Anoside.angular = angular.module('anoside', ['ngResource', 'ngSanitize', 'infinite-scroll'])

# Making it work with CSRF protection
# https://shellycloud.com/blog/2013/10/how-to-integrate-angularjs-with-rails-4
Anoside.angular.config ($httpProvider) ->
  authToken = $('meta[name="csrf-token"]').prop('content')
  $httpProvider.defaults.headers.common['X-CSRF-TOKEN'] = authToken

# Making it work with turbolinks
# https://shellycloud.com/blog/2013/10/how-to-integrate-angularjs-with-rails-4
$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
