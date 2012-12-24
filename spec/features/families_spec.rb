require 'spec_helper'

describe 'addressbook homepage' do
	before(:each) do
		visit '/families'
	end

	it 'should start at the root' do
		current_path.should == families_path
	end

	it 'should welcome you' do
		page.should have_content?('Welcome to Fleck Address Book')
	end

end