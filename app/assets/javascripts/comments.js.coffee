class Comment
  constructor: (@$form) ->
    @$comments = @$form.siblings('ul')

  render: (comment) ->
    @$comments.append(Anoside.render('#comment', comment))

class Form
  constructor: (@$form) ->
    @$form.on
      click: =>
        @expand()
        @showButton()

      'ajax:success': (event, data) =>
        @renderComment(data)
        @clearForm()

  expand: ->
    @$form.height(60)

  showButton: ->
    @$form.children('input[type="submit"]').show()

  renderComment: (comment) ->
    new Comment(@$form).render(comment)

  clearForm: ->
    @$form.find('textarea').val('')

$ ->
  if $('#posts.index').length
    $('.comments form').each ->
      new Form($(@))
