Anoside.Views.Posts = Backbone.View.extend
  el: 'ul.posts'
  collection: Anoside.posts

  initialize: ->
    @collection.fetch()

    @listenTo(@collection, 'add', @prepend)

  prepend: (post) ->
    postView = new Anoside.Views.Post
      model: post

    @$el.prepend(postView.render().$el)
