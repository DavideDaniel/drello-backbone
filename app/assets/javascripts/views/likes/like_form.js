Drello.Views.ItemForm = Backbone.View.extend({
  template: JST['likes/form'],
  tagName: 'form',

  events: {
    'submit': 'submit'
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    var button = this.$('.small btn mdi-action-thumb-up').val();
    var params = {
      done: true,
      consumer_id: this.collection.card.consumer_id,
      card_id: this.collection.card.id
    };
    this.collection.create(params, { wait: true });
    this.render();
  }
});
