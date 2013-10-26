Anoside.angular.directive 'pressEnterKey', ($parse) ->
  (scope, elm, attr) ->
    elm.bind 'keypress', (event) ->
      if event.which == 13
        fn = $parse(attr.pressEnterKey)
        scope.$apply ->
          fn(scope, $event: event)


Anoside.angular.directive 'resourceBody', ->
  (scope, elm) ->
    resource = if _.has(scope, 'post') then scope.post else scope.comment

    elm.addClass('deleted') unless _.isNull(resource.deleted_at)
    elm.html(resource.body)
