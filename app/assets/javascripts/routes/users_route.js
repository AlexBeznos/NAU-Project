NauProj.UsersRoute = Ember.Route.extend({
	model: function() {
		this.store.find('user')
	}
});