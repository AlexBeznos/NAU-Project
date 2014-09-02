NauProj.NewsController = Ember.ArrayController.extend({
  isForm: false,
  newsContent: "",
  sortProperties: ['id'],
  sortAscending: false,
  actions: {
    createNews: function() {
      var controller = this;
      news = this.store.createRecord('news', {
        title: this.get('newsTitle'),
        body: this.get('newsContent'),
        alias: this.get('newsAlias')
      });
      news.save().then(function() {
        controller.set('isForm', false)
      });
    },
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
  }
});