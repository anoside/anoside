Anoside.Views.Post = Backbone.View.extend
  tagName: 'li'
  className: 'post'
  template: HandlebarsTemplates['post']

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.toJSON()))

    collection = new Anoside.Collections.Comments()
    new Anoside.Views.Comments(collection: collection, parentEl: @el, postModel: @model)

    @
