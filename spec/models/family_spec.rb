require 'spec_helper'

describe Family do
	it 'has a valid factory' do
		FactoryGirl.create(:family).should be_valid
	end
	
	it 'fails without a name' do
		FactoryGirl.build(:family, name:nil).should_not be_valid
	end
end