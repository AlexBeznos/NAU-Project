NauProj.WysiwygEditorComponent = Ember.Component.extend({
  classNames: ['wysiwyg-editor'],
  btnSize: 'btn-xs',
  height: 120,

  willDestroyElement: function() {
    this.$('textarea').destroy();
  },

  didInsertElement: function() {
    var _this = this;
    var btnSize = this.get('btnSize');
    var height = this.get('height');

    this.$('textarea').summernote({
      height: height
    });

    var content = this.get('content');
    this.$('textarea').code(content);
    this.$('.btn').addClass(btnSize);
  },
  
  keyUp: function() {
    this.doUpdate();
  },

  click: function() {
    this.doUpdate();
  },

  doUpdate: function() {
    var content = this.$('.note-editable').html();
    this.set('content', content);
  }
});
