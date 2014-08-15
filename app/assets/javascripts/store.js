NauProj.Store = DS.Store.extend({

});

// Override the default adapter with the `DS.ActiveModelAdapter` which
// is built to work nicely with the ActiveModel::Serializers gem.


// Adapter
DS.RESTAdapter.reopen({
  namespace: 'api'
});


// Verification token
$(function() {
    var token = $('meta[name="csrf-token"]').attr('content');
    return $.ajaxPrefilter(function(options, originalOptions, xhr) {
        return xhr.setRequestHeader('X-CSRF-Token', token);
    });
});

