Anoside.Views.Tags = Backbone.View.extend
  el: 'ul.tags'

  initialize: (options) ->
    @$parentEl = $(options.parentEl)
    tagIds = options.postModel.attributes.links.tags.join(',')

    unless _.isEmpty(tagIds)
      @collection.fetch(data: { ids: tagIds })

    @listenTo(@collection, 'add', @append)

  append: (tag) ->
    tagView = new Anoside.Views.Tag
      model: tag

    @$parentEl.find('.tags ul').append(tagView.render().$el)
