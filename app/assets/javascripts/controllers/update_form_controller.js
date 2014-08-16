NauProj.UpdateFormController = Ember.Controller.extend({
	categories: function() {
		return this.store.find('category')
	}.property('store'),
	actions: {
		shit: function() {
			console.log(this.get('model').get('category_ids'))
		}
	}
})