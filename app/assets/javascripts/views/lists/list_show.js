Drello.Views.ListShow = Backbone.CompositeView.extend({
  orderOptions: {
    modelElement: '.card-display',
    modelName: 'card',
    subviewContainer: '.list-cards'
  },

  events: {
    'sortreceive': 'receiveCard',
    'sortremove': 'removeCard',
    'sortstop': 'saveCards'
  },

  template: JST['lists/show'],

  className: 'list-display',

  initialize: function () {
    this.collection = this.model.cards();
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.collection, 'add', this.addCard);
    this.listenTo(this.collection, 'add resize', this.setHeight);
  },

  addCard: function (card) {
    var view = new Drello.Views.CardShow({
      model: card
    });
    this.addSubview('.list-cards', view);
  },

  receiveCard: function(event, ui) {
    var $cardDisplay = ui.item,
        cardId = $cardDisplay.data('card-id'),
        newOrder = $cardDisplay.index();
    var cardClone = new Drello.Models.Card({
      id: cardId,
      list_id: this.model.id,
      order: newOrder
    });
    cardClone.save();
    this.collection.add(cardClone, {silent: true});
    this.saveCards(event);
  },

  removeCard: function(event, ui) {
    var $cardDisplay = ui.item,
        cardId = $cardDisplay.data('card-id'),
        cards = this.model.cards(),
        cardToRemove = cards.get(cardId),
        cardSubviews = this.subviews('.list-cards');
    cards.remove(cardToRemove);

    var subviewToRemove = _.findWhere(cardSubviews, {model: cardToRemove});
    cardSubviews.splice(cardSubviews.indexOf(subviewToRemove), 1);
  },

  render: function () {
    var content = this.template({
      list: this.model
    });
    this.$el.html(content);
    this.$el.data('list-id', this.model.id);

    this.renderCards();
    this.renderFooter();
    setTimeout(this.setHeight.bind(this));
    // this.setHeight();
    return this;
  },

  renderCards: function () {
    this.model.cards().each(this.addCard.bind(this));
    this.$('.list-cards').sortable({connectWith: '.list-cards'});
  },

  renderFooter: function () {
    var formView = new Drello.Views.CardForm({
      collection: this.model.cards()
    });
    this.addSubview('.list-footer', formView);
  },

  saveCards: function(event) {
    event.stopPropagation(); // Prevent list sorting listener from firing.
    this.saveOrders();
  },

  setHeight: function() {
    this.$('.list-cards').css('');
    var listsHeight = this.$el.parent().height();
    var listHeight = this.$el.height();
    var headerHeight = this.$('.list-heading').height();
    var footerHeight = this.$('.list-footer').height();
    var cardsHeight = this.$('.list-cards').height();

    this.$('.list-cards').css('max-height',
          listsHeight - headerHeight - footerHeight - 11);
  }
});

_.extend(Drello.Views.ListShow.prototype, Drello.Utils.OrderView);
