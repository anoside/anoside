Anoside.Views.Comments = Backbone.View.extend
  el: 'ul.comments'

  initialize: (options) ->
    @$parentEl = $(options.parentEl)
    commentIds = options.postModel.attributes.links.comments.join(',')

    unless _.isEmpty(commentIds)
      @collection.fetch(data: { ids: commentIds })

    @listenTo(@collection, 'add', @append)

  append: (comment) ->
    commentView = new Anoside.Views.Comment
      model: comment

    @$parentEl.find('.comments').append(commentView.render().$el)
