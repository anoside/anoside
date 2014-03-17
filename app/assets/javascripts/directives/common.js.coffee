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
    body = resource.body

    # Parse tag
    body = body.replace(/\#([a-zA-Z0-9ぁ-龥]+)/g, '<a href="/tags/$1">#$1</a>')

    # Parse URL
    # body = body.replace(/(http.[^\s]+)/, '<a href="$1" target="_blank">$1</a>')

    # Replace all new lines with `<br>`
    body = body.replace(/\n{3,}/g, '<br><br>').replace(/\n/g, '<br>')

    elm.addClass('deleted') unless _.isNull(resource.deleted_at)
    elm.html(body)
