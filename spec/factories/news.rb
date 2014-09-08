FactoryGirl.define do 
	factory :news do |f|
		f.title "Hello world"
		f.body "Hello world this is my first news for now!"
		f.alias "first"
	end
end