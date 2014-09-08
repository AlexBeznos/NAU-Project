require 'rails_helper'

describe Document do
	it "should have valid factory" do
		FactoryGirl.create(:document).should be_valid
	end
	it "should have name" do
		FactoryGirl.build(:document, name: nil).should_not be_valid
	end
	it "should have and belongs to category" do
		document = FactoryGirl.create(:document)
		category = FactoryGirl.create(:category)
		document.categories << category
		document.categories.last.should eq(category)
		category.documents.last.should eq(document)
	end
end