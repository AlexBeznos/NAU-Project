NauProj.PageController = Ember.ObjectController.extend({
  isEditing: false,
  actions: {
    destroy: function() {
      var news = this.get('model');
      news.deleteRecord();
      news.save();
    },
    edit: function() {
      this.get('isEditing') ? this.set('isEditing', false) : this.set('isEditing', true)
    },
    editIt: function() {
      var controller = this;
      this.get('model')
          .save()
          .then(function() {
            controller.set('isEditing', false)
          });
    }
  }
});