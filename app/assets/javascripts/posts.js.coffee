class TagAdditionButton
  constructor: (@$button) ->
    @$button.on
      click: =>
        @showTagAdditionForm()
        @hideTagsAndSelf()

  showTagAdditionForm: ->
    $tagAdditionForm = @$button.siblings('.tag-addition-form').children('form')

    new TagAdditionForm($tagAdditionForm).show()

  hideTagsAndSelf: ->
    @$button.siblings('ul').hide()
    @$button.hide()

  showTagsAndSelf: (tags) ->
    $tags = @$button.siblings('ul')

    $tags.children().remove()
    $tags.append(Anoside.render('#tag', tags))

    $tags.show()
    @$button.show()


class TagAdditionForm
  constructor: (@$form) ->
    @$form.on
      'ajax:success': (event, data) =>
        $tagAdditionButton = @$form.parent().siblings('.tag-addition-button')

        @hide()
        new TagAdditionButton($tagAdditionButton).showTagsAndSelf(data)

  hide: ->
    @$form.parent().hide()

  show: ->
    @$form.parent().show()


$ ->
  if $('.posts-index').length or $('.posts-show').length
    $('.post .tag-addition-button').each ->
      new TagAdditionButton($(@))
