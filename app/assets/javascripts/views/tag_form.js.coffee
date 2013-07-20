Anoside.Views.TagForm = Backbone.View.extend
  initialize: (options) ->
    @$el = options.$postView.find('.tags form')
    @postModel = options.postModel

    @$body = @$el.find('#post_tag_list')

  events:
    'click button': 'saveTag'

  params: ->
    tag_list: @$body.val()

  saveTag: (e) ->
    e.preventDefault()

    tag = @postModel.tags.set(@params())
    @collection.create(tag)

    @$body.val('')
