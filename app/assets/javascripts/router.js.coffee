Anoside.Router = Backbone.Router.extend
  routes:
    '': 'index'

  index: ->
    new Anoside.Views.Posts()
    new Anoside.Views.PostForm()


new Anoside.Router()
