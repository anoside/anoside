Anoside.Views.TagAdditionButton = Backbone.View.extend
  events:
    'click': 'showTagAdditionForm'

  initialize: ($postView) ->
    @setElement($postView.find('.js-tag-addition-button'))
    @tagForm = $postView.find('form')

  showTagAdditionForm: (e) ->
    @tagForm.show()
