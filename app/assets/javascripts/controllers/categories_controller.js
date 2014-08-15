NauProj.CategoriesController = Ember.ArrayController.extend({
  isForm: false,
	actions: {
    createCategory: function() {
      var controller = this,
          category = this.store.createRecord('category', {
                        name: this.get('categoryName')
                      })
      category.save().then(function() {
        controller.set('isForm', false)
      });
    },
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
	}
});