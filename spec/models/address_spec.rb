require 'spec_helper'

describe Address do
	it 'has a valid factory' do
		FactoryGirl.create(:address).should be_valid
	end
	
	it 'fails without a name' do
		FactoryGirl.build(:address, name:nil).should_not be_valid
	end
	
	it 'fails without a street' do
		FactoryGirl.build(:address, street:nil).should_not be_valid
	end
	
	it 'fails without a city' do
		FactoryGirl.build(:address, city:nil).should_not be_valid
	end

	it 'fails without a state' do
		FactoryGirl.build(:address, state:nil).should_not be_valid
	end

	it 'fails with a state that is too short' do
		FactoryGirl.build(:address, state:'A').should_not be_valid
	end

	it 'fails with a state that is too long' do
		FactoryGirl.build(:address, state:'AAAAAA').should_not be_valid
	end

	it 'fails with an invalid state' do
		FactoryGirl.build(:address, state:'ZZ').should_not be_valid

		FactoryGirl.build(:address, state:12).should_not be_valid
	end

	it 'fails without a zip code' do
		FactoryGirl.build(:address, zipCode:nil).should_not be_valid
	end

	it 'fails with an invalid zip code' do
		FactoryGirl.build(:address, zipCode:'IamAZipCode').should_not be_valid
		FactoryGirl.build(:address, zipCode:1234).should_not be_valid
	end

end