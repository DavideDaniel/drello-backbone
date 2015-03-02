window.Drello = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Drello.Routers.Router;
    Backbone.history.start();
  }
};
