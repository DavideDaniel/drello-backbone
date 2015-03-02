Drello.Views.LikesList = Backbone.CompositeView.extend({
  initialize: function () {
    this.likeFormView = new Drello.Views.LikeForm({
      model: new Drello.Models.Like(),
      collection: this.collection
    });
    this.addSubview('.like-list-form', this.likeFormView);
    this.collection.each(this.addLikeView.bind(this));
    this.listenTo(this.collection, 'add', this.addLikeView);
  },

  addLikeView: function (like) {
    var likeView = new Drello.Views.LikeShow({
      model: like
    });
    this.addSubview('.like-list-likes', likeView);
  },

  template: JST['likes/list'],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.attachSubviews();
    return this;
  }
});
