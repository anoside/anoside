Anoside.Models.Post = Backbone.Model.extend
  defaults:
    created_at: moment().format()

  initialize: ->
    @comments = new Anoside.Models.Comment
    @tags = new Anoside.Models.Tag
