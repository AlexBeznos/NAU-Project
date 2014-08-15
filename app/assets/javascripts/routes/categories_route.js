NauProj.CategoriesRoute = Ember.Route.extend({
	model: function() {
		this.store.find('category')
	}
});