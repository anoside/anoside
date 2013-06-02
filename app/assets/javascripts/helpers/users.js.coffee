Handlebars.registerHelper 'ifIsUserSignedIn', (options) ->
  if _.isNull(Anoside.currentUser.id)
    options.inverse(@)
  else
    options.fn(@)
