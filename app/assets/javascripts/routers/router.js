Drello.Routers.Boards = Backbone.Router.extend({
initialize: function() {
    var dropDownView = new Drello.Views.DropDownView({
      collection: Drello.Collections.boards
    });
    $('#add-dropdown').append(dropDownView.render().$el);
    this.$rootEl = $('#main');
  },

  routes: {
    '': 'boardsIndex',
    'boards/:id': 'boardShow'
  },

  boardsIndex: function () {
    Drello.Collections.boards.fetch();

    var view = new Drello.Views.BoardsIndex({
      collection: Drello.Collections.boards
    });

    this._swapView(view);
  },

  boardShow: function (id) {
    var board = Drello.Collections.boards.getOrFetch(id);

    var view = new Drello.Views.BoardShow({
      model: board
    });

    this._swapView(view);
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
