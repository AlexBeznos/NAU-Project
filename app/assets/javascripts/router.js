// For more information see: http://emberjs.com/guides/routing/

NauProj.Router.map(function() {
	this.route('index', { path: '/'}),
	this.resource('users'),
	this.resource('categories'),
	this.resource('documents'),
	this.resource('news'),
	this.resource('pages'),
	this.resource('workers')
});
