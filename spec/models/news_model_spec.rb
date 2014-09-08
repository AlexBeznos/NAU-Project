require 'rails_helper'

describe News do
	it "should have valide factory" do
		FactoryGirl.create(:news).should be_valid
	end
	it "should be invalide without alias" do
		FactoryGirl.build(:news, alias: nil).should_not be_valid
	end
	it "should have uniqua alias" do
		FactoryGirl.create(:news)
		FactoryGirl.build(:news).should_not be_valid
	end
end