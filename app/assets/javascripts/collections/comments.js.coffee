Anoside.Collections.Comments = Backbone.Collection.extend
  model: Anoside.Models.Comment
  url: '/api/comments'

  parse: (response) ->
    response.comments
