require 'spec_helper'

describe Email do
	it 'has a valid factory' do
		FactoryGirl.create(:email).should be_valid
	end
end