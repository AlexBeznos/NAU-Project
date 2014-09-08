require 'rails_helper'

describe Document do
	it "should have valid factory" do
		FactoryGirl.create(:category).should be_valid
	end
	it "should have name" do
		FactoryGirl.build(:category, name: nil).should_not be_valid
	end
	it "should have uniqua name" do
		FactoryGirl.create(:category)
		FactoryGirl.build(:category).should_not be_valid
	end
	it "should have many workers" do
		category = FactoryGirl.create(:category)
		worker = FactoryGirl.create(:worker)
		category.workers << worker
		category.workers.last.should eq(worker)
	end
	describe "reletions" do
		before :each do
			@document = FactoryGirl.create(:document)
			@category = FactoryGirl.create(:category)
		end
		it "should have many documents" do
			@category.documents << @document
			@category.documents.last.should eq(@document)
		end
		it "should belongs to document" do
			@category.documents << @document
			@document.categories.last.should eq(@category)
		end
	end
end