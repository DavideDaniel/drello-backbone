/*
 * Mixin for Views
 * Using view must define:
 * orderOptions: {
 *   modelElement: 'modelElementSelector',
 *   modelName: 'modelName',
 *   subviewContainer: 'selector'
 * }
 */
Drello.Utils.OrderView = {
  resortSubviews: function() {
    var subviews = this.subviews(this.orderOptions.subviewContainer);
    subviews.sort(function(subview1, subview2) {
      return subview1.model.get('order') - subview2.model.get('order');
    });
  },
  saveOrders: function() {
    var itemElements = this.$(this.orderOptions.modelElement),
        idAttribute = this.orderOptions.modelName + '-id',
        collection = this.collection;
    itemElements.each(function(index, element) {
      var $itemElement = $(element),
          itemId = $itemElement.data(idAttribute);
      var item = collection.get(itemId);
      if (item.get('order') === index) {
        return;
      }
      item.save({order: index});
    }.bind(this));
    collection.sort();
    if (this.orderOptions.subviewContainer) {
      this.resortSubviews();
    }
  }
};
