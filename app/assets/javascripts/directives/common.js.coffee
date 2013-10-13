Anoside.angular.directive 'pressEnterKey', ($parse) ->
  (scope, elm, attr) ->
    elm.bind 'keypress', (event) ->
      if event.which == 13
        fn = $parse(attr.pressEnterKey)
        scope.$apply ->
          fn(scope, $event: event)
