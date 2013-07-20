Anoside.Views.CommentForm = Backbone.View.extend
  initialize: (options) ->
    @$parentEl = $(options.parentEl)
    @$el = @$parentEl.find('form.new-comment')
    @postModel = options.postModel

    @$body = @$el.find('.comment-body')

  events:
    'click button': 'saveComment'

  params: ->
    body: @$body.val()

  saveComment: (e) ->
    e.preventDefault()

    comment = @postModel.comments.set(@params())
    @collection.url = "/api/posts/#{@postModel.id}/comments"
    @collection.create(comment)

    @$body.val('')
