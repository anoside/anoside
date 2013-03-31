(function() {
  Anoside.Views.Post = Backbone.View.extend({
    tagName: 'div',
    className: '.post',
    template: JST['post'],

    render: function() {
      var tmpl = _.template(this.template);
      this.$el.html(tmpl(this.model.toJSON()));

      return this;
    }
  });

  Anoside.Views.Posts = Backbone.View.extend({
    el: $('ul.posts'),

    initialize: function(posts) {
      this.collection = new Anoside.Collections.Posts(posts);
      this.render();
    },

    render: function() {
      this.collection.each(function(post) {
        this.renderPost(post);
      }, this);
    },

    renderPost: function(post) {
      var postView = new Anoside.Views.Post({
        model: post
      });

      this.$el.append(postView.render().el);
    }
  });
})();