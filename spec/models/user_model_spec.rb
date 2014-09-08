require 'rails_helper'

describe User do
	it "should have valide factory" do
		FactoryGirl.create(:user).should be_valid
	end
end