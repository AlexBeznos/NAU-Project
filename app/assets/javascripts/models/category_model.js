NauProj.Category = DS.Model.extend({
	name: DS.attr(),
	users_ids: DS.hasMany('user', {async: true})
});