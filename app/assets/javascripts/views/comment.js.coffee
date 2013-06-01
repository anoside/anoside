Anoside.Views.Comment = Backbone.View.extend
  tagName: 'li'
  className: 'comment'
  template: HandlebarsTemplates['comment']

  initialize: ->
    @listenTo(@model, 'change', @render)

  render: ->
    @$el.html(@template(@model.toJSON()))
    @
