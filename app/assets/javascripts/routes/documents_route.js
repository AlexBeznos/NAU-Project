NauProj.DocumentsRoute = Ember.Route.extend({
	model: function() {
		this.store.find('document')
	}
});