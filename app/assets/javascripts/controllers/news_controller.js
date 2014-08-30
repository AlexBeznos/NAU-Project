NauProj.NewsController = Ember.ArrayController.extend({
  isForm: false,
  newsContent: "",
	actions: {
    createNews: function() {
      news = this.store.createRecord('news', {
      	title: this.get('newsTitle'),
      	body: this.get('newsContent'),
      	alias: this.get('newsAlias')
      });
      news.save();
    },
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
	}
});