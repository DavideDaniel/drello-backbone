Drello.Collections.Likes = Backbone.Collection.extend({
  model: Drello.Models.Like,
  url: '/api/items',

  initialize: function (models, options) {
    this.card = options.card;
  },
});
