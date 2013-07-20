Anoside.Views.Tags = Backbone.View.extend
  initialize: (options) ->
    @$parentEl = $(options.parentEl)
    tagIds = options.postModel.attributes.links.tags.join(',')

    unless _.isEmpty(tagIds)
      @collection.fetch(data: { ids: tagIds })

    @listenTo(@collection, 'add', @append)

  append: (tagModel) ->
    $tagList = @$parentEl.find('.tags ul')

    if tagModel.isNew()
      _.each tagModel.attributes.tags, (tag) ->
        tagView = new Anoside.Views.Tag
          model: new Anoside.Models.Tag(name: tag.name)

        $tagList.append(tagView.render().$el)
    else
      tagView = new Anoside.Views.Tag
        model: tagModel

      $tagList.append(tagView.render().$el)
