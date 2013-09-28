Anoside.IndexController = Ember.ArrayController.extend
  actions:
    createPost: ->
      body = @get('postBody')
      post = @store.createRecord 'post',
        body: body

      @set('postBody', '')

      post.save()
