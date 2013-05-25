Anoside.Views.Post = Backbone.View.extend
  tagName: 'li'
  template: HandlebarsTemplates['post']

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'remove', @remove)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @

Anoside.Views.PostsList = Backbone.View.extend
  el: 'ul.posts'

  initialize: ->
    @collection = new Anoside.Collections.Posts()
    @collection.fetch()

    @listenTo(@collection, 'add', @append)
    @listenTo(@collection, 'reset', @render)

  render: ->
    @collection.each (post) ->
      @append(post)
    , @
    @

  append: (post) ->
    postView = new Anoside.Views.Post
      model: post

    @$el.append(postView.render().$el)
