Anoside.angular.directive 'timeAgo', ->
  (_, elm, attr) ->
    elm.text(moment(attr.timeAgo).fromNow())
