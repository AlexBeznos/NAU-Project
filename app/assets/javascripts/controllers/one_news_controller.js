NauProj.OneNewsController = Ember.ObjectController.extend({
  actions: {
    destroy: function() {
      var news = this.get('model');
      news.deleteRecord();
      news.save();
    }
  }
});