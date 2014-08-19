NauProj.UpdateFormController = Ember.Controller.extend({
  needs: 'document',
  documentController: Ember.computed.alias("controllers.document"),
  categories: function() {
    return this.store.find('category')
  }.property('store'),
  proxiedCategory: Ember.computed.map('categories', function(categories) {
    {
      return Ember.ObjectProxy.create({
        content: categories,
        checked: false
      });
    }
  }),
  proxiedCheckedCategory: Ember.computed.filterBy('proxiedCategory', 'checked', true),
  proxiedItems: Ember.computed.mapBy('proxiedCheckedCategory', 'content.id'),
  actions: {
    updateDocument: function() {
      var id = this.get('model').get('id'),
          fd = new FormData(document.getElementById("uploadForm")),
          controller = this;
      
      fd.append("name", this.get('model').get('name'));
      fd.append("categories", this.get('proxiedItems'));   

      Ember.$.ajax({
        url: '/api/documents/' + id,
        type: 'PUT',
        data: fd,
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function(res) {
          controller.get('model').set('doc_path', res.doc_path)
        },
        error: function(res) {
          console.log(res)
        }
      });

      this.get('documentController').set('isUpdating', false);
    }
  }
})