NauProj.NewsController = Ember.ArrayController.extend({
  isForm: false,
  newsContent: "Someshit",
	actions: {
    createCategory: function() {
      console.log(this.get('newsContent'));
    },
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
	}
});