NauProj.WorkersController = Ember.ArrayController.extend({
  isForm: false,
  categoryId: 1,
  categories: function() {
    return this.store.find('category')
  }.property('store'),
  actions: {
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    },
    create: function() {
      var self = this,
          worker = this.store.createRecord('worker', {
           	fio: this.get('fio'),
          	email: this.get('mail'),
           	category_id: parseInt(this.get('categoryId'))
          });
      worker.save().then(function() {
      	self.set('isForm', false);
      	self.set('fio', "");
      	self.set('mail', "");
      })
    }
  }
});
