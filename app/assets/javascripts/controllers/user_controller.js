NauProj.UserController = Ember.ObjectController.extend({
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
  worker: "",
  worker_fun: Ember.computed('email', function() {
    var email = this.get('email'),
        self = this;
    $.post( "/api/workers/find/", {"email": email}).done(function(data) {
      if($.isEmptyObject(data)) {
        self.set("worker", "<td>Немає в базі!</td><td></td>")
      } else {
        self.set("worker", "<td>" + data.category + "</td><td>" + data.fio + "</td>") 
      }
    });
  }),
  actions: {
    approve: function() {
      this.get('approved') ? this.set('approved', false) : this.set('approved', true);
      this.get('model').save();
    },
    editCategory: function() {
      this.set('isEditCategory', true)
    },
    update: function() {
      var self = this;
      this.get('model').set('category_id', this.get('categoryId'));
      this.get('model').save().then(function() {
        self.set('isEditCategory', false)
      })
    }
  }
})