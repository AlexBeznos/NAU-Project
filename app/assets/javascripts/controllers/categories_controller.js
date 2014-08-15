NauProj.CategoriesController = Ember.ArrayController.extend({
  isForm: false,
	actions: {
    createCategory: function() {
      if(this.get('categoryName')) {
        var controller = this,
            category = this.store.createRecord('category', {
                          name: this.get('categoryName')
                        })
        category.save().then(function() {
          controller.set('isForm', false)
        })
      } else {
        this.set('isForm', false)
      }
    },
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
	}
});