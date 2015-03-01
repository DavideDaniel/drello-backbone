Drello.Models.Board = Backbone.Model.extend({
  urlRoot: 'api/boards',

  cards: function () {
    if (!this._cards) {
      this._cards = new Drello.Collections.Cards([], { board: this });
    }

    return this._cards;
  },

  parse: function (response) {
    if (response.cards) {
      this.cards().set(response.cards, { parse: true });
      delete response.cards;
    }

    return response;
  }
});