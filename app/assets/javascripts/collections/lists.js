Drello.Collections.Lists = Backbone.Collection.extend({
  comparator: 'order',
  model: Drello.Models.List,
  url: 'api/lists',

  initialize: function (models, options) {
    this.board = options.board;
  }
});
