Anoside.Views.Tag = Backbone.View.extend
  tagName: 'li'
  className: 'tag'
  template: HandlebarsTemplates['tag']

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
