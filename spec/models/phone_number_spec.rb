require 'spec_helper'

describe PhoneNumber do
	it 'has a valid factory' do
		FactoryGirl.create(:phone_number).should be_valid
	end

	it 'fails if there is no name' do
		FactoryGirl.build(:phone_number,name:nil).should_not be_valid
	end
	it 'fails if there is no phone number' do
		FactoryGirl.build(:phone_number,value:nil).should_not be_valid
	end
end