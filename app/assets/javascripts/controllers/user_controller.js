NauProj.UserController = Ember.ObjectController.extend({
	actions: {
		approve: function() {
			this.get('approved') ? this.set('approved', false) : this.set('approved', true);
			this.get('model').save();
		}
	}
})