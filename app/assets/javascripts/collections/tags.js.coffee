Anoside.Collections.Tags = Backbone.Collection.extend
  model: Anoside.Models.Tag
  url: '/api/tags'

  parse: (response) ->
    response.tags
