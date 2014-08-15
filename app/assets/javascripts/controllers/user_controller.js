NauProj.UserController = Ember.ObjectController.extend({
	category: function() {
		var id = this.get('model').get('category_id');
		return this.store.find('category', id)
	}.property('model.category_id, store'),
	actions: {
		approve: function() {
			this.get('approved') ? this.set('approved', false) : this.set('approved', true);
			this.get('model').save();
		}
	}
})