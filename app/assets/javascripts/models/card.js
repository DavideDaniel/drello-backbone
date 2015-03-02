Drello.Models.Card = Backbone.Model.extend({
  urlRoot: '/api/cards',

  likes: function () {
    if (!this._likes) {
      this._likes = new Drello.Collections.Likes([], { card: this });
    }
    return this._likes;
  },

  parse: function (resp) {
    if (resp.likes) {
      this.likes().set(resp.likes);
      delete resp.likes;
    }
    return resp;
  }
});
