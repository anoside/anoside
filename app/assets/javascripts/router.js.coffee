Anoside.Router = Backbone.Router.extend
  routes:
    '': 'index'

  index: ->
    new Anoside.Views.PostsList()

new Anoside.Router()
