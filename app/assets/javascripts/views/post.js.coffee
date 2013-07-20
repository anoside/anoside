Anoside.Views.Post = Backbone.View.extend
  tagName: 'li'
  className: 'post'
  template: HandlebarsTemplates['post']

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.toJSON()))

    tags = new Anoside.Collections.Tags()

    new Anoside.Views.Tags(collection: tags, parentEl: @el, postModel: @model)
    new Anoside.Views.TagAdditionButton(@$el)
    new Anoside.Views.TagForm(collection: tags, postModel: @model, $postView: @$el)

    unless @model.isNew()
      comments = new Anoside.Collections.Comments()

      new Anoside.Views.Comments(collection: comments, parentEl: @el, postModel: @model)
      new Anoside.Views.CommentForm(collection: comments, parentEl: @el, postModel: @model)

    @
