// For more information see: http://emberjs.com/guides/routing/

NauProj.Router.map(function() {
  this.route('index', function() {
  	this.resource('users'),
  	this.resource('categories'),
  	this.resource('documents')
  })
});