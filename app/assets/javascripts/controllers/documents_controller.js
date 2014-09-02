NauProj.DocumentsController = Ember.ArrayController.extend({
  isForm: false,
  sortProperties: ['id'],
  sortAscending: false,
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
      fd.append("categories", this.get('proxiedItems'));   

      doc = this.store.createRecord('document', {
        name: this.get('documentName'),
        doc_path: 'Is uploading',
        open: this.get('open')
      });

      doc.save().then(function(doc) {
        $("#createDocument").prepend("<div class='alert alert-warning' role='alert'>Please wait! Your file is uploading!</div>");
        Ember.$.ajax({
          url: '/api/documents/'+ doc.id,
          type: 'PUT',
          data: fd,
          processData: false,
          contentType: false,
          success: function(res) {
            doc.set('doc_path', res.doc_path);
            controller.set('isForm', false);
          },
          error: function(res) {
            $("#createDocument").prepend(res.error);
          }
        });
      })

    }
  }
});