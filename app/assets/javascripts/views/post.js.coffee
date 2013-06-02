Anoside.Views.Post = Backbone.View.extend
  tagName: 'li'
  className: 'post'
  template: HandlebarsTemplates['post']

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.toJSON()))

    unless @model.isNew()
      comments = new Anoside.Collections.Comments()
      new Anoside.Views.Comments(collection: comments, parentEl: @el, postModel: @model)

    @
