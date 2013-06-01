Anoside.Views.Comments = Backbone.View.extend
  el: 'ul.comments'
  collection: Anoside.comments

  initialize: (options) ->
    @$parentEl = $(options.parentEl)
    commentIds = options.postModel.attributes.links.comments.join(',')

    unless _.isEmpty(commentIds)
      @collection.fetch(data: { ids: commentIds })

    @listenTo(@collection, 'add', @prepend)

  prepend: (comment) ->
    commentView = new Anoside.Views.Comment
      model: comment

    @$parentEl.find('.comments').prepend(commentView.render().$el)
