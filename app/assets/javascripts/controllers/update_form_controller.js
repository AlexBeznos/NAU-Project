NauProj.UpdateFormController = Ember.Controller.extend({
  categories: function() {
    return this.store.find('category')
  }.property('store'),
  proxiedCategory: Ember.computed.map('categories', function(categories) {
    {
      return Ember.ObjectProxy.create({
        content: categories,
        checked: false
      });
    }
  }),
  proxiedCheckedCategory: Ember.computed.filterBy('proxiedCategory', 'checked', true),
  proxiedItems: Ember.computed.mapBy('proxiedCheckedCategory', 'content.id'),
  actions: {
    shit: function() {
    	console.log(this.get('model').get('category_ids'))
    },
    createDocument: function() {
      console.log(this.get('proxiedItems'))
    }
  }
})