NauProj.PagesController = Ember.ArrayController.extend({
  isForm: false,
  pageContent: "",
  actions: {
    createPage: function() {
      var controller = this;
      page = this.store.createRecord('page', {
        name: this.get('pageName'),
        page_content: this.get('pageContent'),
        alias: this.get('pageAlias')
      });
      page.save().then(function() {
        controller.set('isForm', false)
      });
    },
    openForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    }
  }
});