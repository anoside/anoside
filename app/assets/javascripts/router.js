(function() {
  Anoside.Router = Backbone.Router.extend({
    routes: {
      '': 'index'
    },

    index: function() {
      new Anoside.Views.Posts([
        { body: 'hello' },
        { body: 'hi' }
      ]);
    }
  });

  new Anoside.Router();
})();
