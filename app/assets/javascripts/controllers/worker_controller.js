NauProj.WorkerController = Ember.ObjectController.extend({
	isEditMail: false,
	isEditFio: false,
  isEditCategory: false,
  categoryId: 1,
  categories: function() {
    return this.store.find('category')
  }.property('store'),
  category: Ember.computed('category_id', function() {
    if(this.get('category_id')) {
      return this.store.find('category', this.get('category_id'))
    }
  }),
	actions: {
    editMail: function() {
      this.set('isEditMail', true)
    },
    editFio: function() {
      this.set('isEditFio', true)
    },
    editCategory: function() {
      this.set('isEditCategory', true)
    },
    destroy: function() {
      var worker = this.get('model');
      worker.deleteRecord();
      worker.save();
    },
    update: function() {
      var self = this;
      if(this.get('isEditCategory')) {
        this.get('model').set('category_id', this.get('categoryId'))
      }
      this.get('model').save().then(function() {
        if(self.get('isEditFio')) {
          self.set('isEditFio', false)
        } else if(self.get('isEditMail')) {
          self.set('isEditMail', false)
        } else if(self.get('isEditCategory')) {
          self.set('isEditCategory', false)
        }
      })
    }
	}
});