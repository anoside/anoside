Anoside.Views.PostForm = Backbone.View.extend
  el: 'form.new-post'
  collection: Anoside.posts

  initialize: ->
    @$body = @$el.find('.body')

  events:
    'click button': 'savePost'

  params: ->
    body: @$body.val()

  savePost: (e) ->
    e.preventDefault()

    post = new Anoside.Models.Post(@params())
    @collection.create(post, wait: true)

    @$body.val('')
