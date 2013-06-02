Anoside.Models.Post = Backbone.Model.extend
  defaults:
    created_at: moment().format()

  initialize: ->
    @comments = new Anoside.Models.Comment
    @comments.url = "/api/posts/#{@id}/comments"
