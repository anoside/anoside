Anoside.Views.Posts = Backbone.View.extend
  el: 'ul.posts'
  collection: Anoside.posts

  initialize: ->
    @collection.fetch()

    @listenTo(@collection, 'add', @prepend)
    @listenTo(@collection, 'reset', @render)

  render: ->
    @collection.each (post) ->
      @prepend(post)
    , @
    @

  prepend: (post) ->
    postView = new Anoside.Views.Post
      model: post

    @$el.prepend(postView.render().$el)
