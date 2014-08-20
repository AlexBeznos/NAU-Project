NauProj.DocumentController = Ember.ObjectController.extend({
	isUpdating: false,
	actions: {
		delete: function() {
			var doc = this.get('model');
			doc.deleteRecord();
			doc.save();
		},
		updateForm: function() {
			this.get('isUpdating') ? this.set('isUpdating', false) : this.set('isUpdating', true)
		},
    toggleForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
	}
});