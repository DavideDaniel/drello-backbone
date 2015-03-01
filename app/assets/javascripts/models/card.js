Drello.Models.Card = Backbone.Model.extend({
  urlRoot: '/api/cards',

  items: function () {
    if (!this._likes) {
      this._likes = new Drello.Collections.Likes([], { card: this });
    }
    return this._likes;
  },

  parse: function (resp) {
    if (resp.items) {
      this.items().set(resp.items);
      delete resp.items;
    }
    return resp;
  }
});