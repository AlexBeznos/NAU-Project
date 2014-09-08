require 'rails_helper'

describe Worker do
	it "should have valide factory" do
		FactoryGirl.create(:worker).should be_valid
	end
end