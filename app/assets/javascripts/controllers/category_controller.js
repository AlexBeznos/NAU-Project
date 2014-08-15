NauProj.CategoryController = Ember.ObjectController.extend({
  isEdit: false,
  actions: {
    deleteCategory: function() {
      var category = this.get('model');
      category.deleteRecord();
      category.save();
    },
    editCategory: function() {
      this.set('isEdit', true)
    },
    saveCategory: function() {
      this.set('isEdit', false);
      this.get('model').save();
    }
  }
});
