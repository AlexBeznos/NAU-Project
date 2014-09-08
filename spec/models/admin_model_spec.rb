require 'rails_helper'

describe Admin do
	it "should have valide factory" do
		FactoryGirl.create(:admin).should be_valid
	end
end