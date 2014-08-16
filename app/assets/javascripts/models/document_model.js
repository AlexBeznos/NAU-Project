NauProj.Document = DS.Model.extend({
	name: DS.attr(),
	doc_path: DS.attr(),
	category_ids: DS.hasMany('category', {async: true})
});