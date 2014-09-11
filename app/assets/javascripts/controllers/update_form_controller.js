NauProj.UpdateFormController = Ember.Controller.extend({
  categories: function() {
    return this.store.find('category')
  }.property('store'),
  open: function() {
    if(this.get('model').get('open')) {
      return true
    } else {
      return false
    };
  }.property('model.open'),
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
      if(this.get('model').get('name')){
        var id = this.get('model').get('id'),
            fd = new FormData(document.getElementById("uploadForm")),
            controller = this;

        fd.append("name", this.get('model').get('name'));
        if(this.get('proxiedItems').length != 0) {
          fd.append("categories", this.get('proxiedItems'))
        }; 
        fd.append("open", this.get('open'));
        $("#uploadForm").prepend("<div class='alert alert-warning' role='alert'>Будь ласка зачекайте! Ваш файл завантажується!</div>");
        Ember.$.ajax({
          url: '/api/documents/' + id,
          type: 'PUT',
          data: fd,
          processData: false,  // tell jQuery not to process the data
          contentType: false,
          success: function(res) {
            controller.get('model').set('doc_path', res.doc_path);
            controller.get('model').set('open', res.open);
          },
          error: function(res) {
            $("#uploadForm").prepend("<div class='alert alert-warning' role='alert'>" + res.error + "</div>");
          }
        });
      } else {
        $("#uploadForm").prepend("<div class='alert alert-danger' role='alert'>Неможливо зберегти документ без і'мя!</div>");
      }
    }
  }
});