Anoside.Collections.Posts = Backbone.Collection.extend
  model: Anoside.Models.Post
  url: '/api/posts'

Anoside.posts = new Anoside.Collections.Posts()
