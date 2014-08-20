NauProj.DocumentsController = Ember.ArrayController.extend({
  isForm: false,
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
    toggleForm: function() {
      this.get('isForm') ? this.set('isForm', false) : this.set('isForm', true)
    },
    createDocument: function() {
      var fd = new FormData(document.getElementById("createDocument")),
          controller = this;
      
      fd.append("name", this.get("documentName"));
      fd.append("categories", this.get('proxiedItems'));   

      Ember.$.ajax({
        url: '/api/documents/',
        type: 'POST',
        data: fd,
        processData: false,  // tell jQuery not to process the data
        contentType: false,
        success: function(res) {
          controller.get('model').set('doc_path', res.doc_path);
          $("#createDocument").prepend("Success!");
        },
        error: function(res) {
          $("#createDocument").prepend(res.error);
        }
      });
    }
  }
});