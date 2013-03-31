window.Anoside = {
  Models: {},
  Collections: {},
  Views: {},
  initialize: function() {
    Backbone.history.start();
    alert('Hello from Backbone!');
  }
};

$(document).ready(function(){
  Anoside.initialize();
});
