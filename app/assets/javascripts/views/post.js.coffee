Anoside.Views.Post = Backbone.View.extend
  tagName: 'li'
  template: HandlebarsTemplates['post']

  initialize: ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'remove', @remove)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
