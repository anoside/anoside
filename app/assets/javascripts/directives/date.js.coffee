Anoside.angular.directive 'timeAgo', ->
  (_, elm, attr) ->
    moment.lang('ja')
    elm.text(moment(attr.timeAgo).fromNow())
