NauProj.User = DS.Model.extend({
	email: DS.attr(),
	approved: DS.attr('boolean'),
	category_id: DS.attr('number')
});