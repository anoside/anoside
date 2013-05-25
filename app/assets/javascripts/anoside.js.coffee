window.Anoside =
  Models: {}
  Collections: {}
  Views: {}
  initialize: ->
    Backbone.history.start()

$(document).ready ->
  Anoside.initialize()
