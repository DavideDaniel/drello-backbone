Drello.Collections.Boards = Backbone.Collection.extend({
model: Drello.Models.Board,
url: 'api/boards',
getOrFetch: function(id) {
    var board = this.get(id);
    if (!board) {
        board = new Drello.Models.Board({
            id: id
        });
        board.fetch({
            success: function() {
                this.add(board);
            }.bind(this)
        });
    } else {
        board.fetch();
    }
    return board;
}
});

Drello.Collections.boards = new Drello.Collections.Boards