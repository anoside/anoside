Handlebars.registerHelper 'timeAgoInWords', (date) ->
  moment(date).fromNow()
