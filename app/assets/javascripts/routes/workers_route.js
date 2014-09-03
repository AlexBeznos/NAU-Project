NauProj.WorkersRoute = Ember.Route.extend({
	model: function() {
		return this.store.find('worker')
	}
});