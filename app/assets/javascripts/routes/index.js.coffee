Anoside.IndexRoute = Ember.Route.extend
  model: ->
    @get('store').findAll('post')
