NauProj.UsersController = Ember.ArrayController.extend({
	numberApproved: function(key, value) {
		return this.filterBy('approved', false).get('length')
	}.property('@each.approved')
})