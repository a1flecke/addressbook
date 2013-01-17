require 'spec_helper'

describe AddressesController do
	describe 'GET #index' do
		context 'no addresses' do
			before do
				@response = get :index , :family_id=>1
			end

			it 'should assign the collection' do
				assigns(:addresses).should eq []
			end
			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end
			it 'should render JSON properly' do
				puts "#{@response}"
				@response.body.should == {}
			end
		end
		context 'there are addresses' do
			it 'should render html properly'
			it 'should render JSON properly'
		end
	end

	context '#show' do
		it 'should throw a 404 if the address is not found (by id)'
		it 'should render HTML properly'
		it 'should render JSON properly'
	end

	context '#new' do
		it 'should redirect to the new address form'
		it 'should render HTML properly'
		it 'should render JSON properly'
		it 'should create the address'
	end

	context '#edit' do
		it 'should throw a 404 if the address is not found'
		it 'should redirect to the edit address form'
	end

	context '#create' do
		it 'should throw a 400 if no family is specified when creating an address'
		it 'should create an address if everything is ok'
		it 'should redirect to the family path if everything is ok (HTML)'
		it 'should respond with JSON if everything is ok (JSON)'
		it 'should redirect to the new address form if there are form errors (HTML)'
		it 'should respond with errors in JSON if there are form errors (JSON)'
	end

	context '#update' do
		it 'should throw a 404 if the address was not found'
		it 'should throw a 404 if the family was not found'
		it 'should redirect to the family page if the address update was successful (HTML)'
		it 'should respond with JSON if the address update was ok (JSON)'
		it 'should redirect to the edit address form if there are form errors (HTML)'
		it 'should respond with errors in JSON if there are form errors (JSON)'
		it 'should update the address'
	end

	context '#destroy' do
		it 'should throw a 404 if the address was not found'
		it 'should throw a 404 if the family was not found'
		it 'should still delete the address if the family was not found'
		it 'should redirect to the family page (HTML)'
		it 'should respond with JSON if the family was found'
	end

end