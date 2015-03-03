window.Drello = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Utils: {},
  initialize: function() {
    new Drello.Routers.Router;
    Backbone.history.start();
  }
};
