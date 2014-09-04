NauProj.UserController = Ember.ObjectController.extend({
  category: Ember.computed('category_id', function() {
    if(this.get('category_id')) {
      return this.store.find('category', this.get('category_id'))
    }
  }),
  actions: {
    approve: function() {
      this.get('approved') ? this.set('approved', false) : this.set('approved', true);
      this.get('model').save();
    }
  }
})