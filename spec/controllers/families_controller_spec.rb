require 'spec_helper'

include Rack::Utils

describe FamiliesController do
	describe 'GET #index' do
		context 'no families' do
			before do
				@response = get :index
			end

			it 'should assign the collection' do
				assigns(:families).should eq []
			end
			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end
			it 'should render JSON properly' do
				response_json = get :index, :format=>:json
				response_json.body.should == "[]"
			end
		end

		context 'there are families' do
			before do
				@family = FactoryGirl.create(:family)
				response = get :index
			end

			it 'should assign the collection' do
				assigns(:families).should eq [@family]
			end

			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end

			it 'should render JSON properly' do
				response_json = get :index, :format=>:json
				response_json.body.should include(@family.name)
			end
		end
	end

	describe '#show' do
		before do
			@family = FactoryGirl.create(:family)
		end

		it 'should throw an RecordNotFound if the family is not found (by id)' do
			expect{
				response = get :show , :id=>@family.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should render HTML properly' do
			response = get :show , :id=>@family.id
			expect(@response).to render_template(:show)
		end

		it 'should render JSON properly' do
			response_json = get :show, :id=>@family.id, :format=>:json
			response_json.body.should include(@family.name)
		end
	end

	describe '#new' do
		it 'should render HTML properly' do
			response = get :new
			expect(@response).to render_template(:new)
		end

		it 'should render JSON properly' do
			response = get :new, format: :json
			response.body.should include "name"
		end

		it 'should assign the family' do
			response = get :new
			assigns(:family).should_not be_nil
		end
	end

	describe '#edit' do
		before do
			@family = FactoryGirl.create(:family)
		end

		it 'should throw an RecordNotFound if the family is not found (by id)' do
			expect{
				response = get :edit , :id=>@family.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should redirect to the edit family form' do
			response = get :edit, id: @family.id
			expect(@response).to render_template(:edit)
		end
	end

	describe '#create' do
		context 'valid family attributes' do
			before do
				@valid_attributes = FactoryGirl.attributes_for(:family)
			end
			
			it 'should create a family if everything is ok' do
				expect{
					post :create, family: @valid_attributes
				}.to change(Family,:count)
			end

			it 'should redirect to the family path if everything is ok (HTML)' do
				response = post :create, family:@valid_attributes
				expect(response).to redirect_to Family.last
			end
			it 'should respond with JSON if everything is ok (JSON)' do
				response = post :create, family: @valid_attributes, format: :json
				response.status == HTTP_STATUS_CODES[:not_found]
			end
		end

		context 'invalid family attributes' do
			before do
				@invalid_attributes = FactoryGirl.attributes_for(:invalid_family)
			end
			
			it 'should not create save the family if there are invalid comment attributes' do
				expect{
					post :create, family: @invalid_attributes
				}.to_not change(Family,:count)
			end

			it 'should redirect to the new family form if there are form errors (HTML)' do
				response = post :create, family: @invalid_attributes
				expect(response).to render_template(:new)
			end

			it 'should respond with errors in JSON if there are form errors (JSON)' do
				response = post :create, family: @invalid_attributes, format: :json
				response.body.should include "can't be blank"
			end
		end
	end

	describe '#update' do
		before do
			@family = FactoryGirl.create(:family)
		end

		it 'should throw an RecordNotFound if the family is not found (by id)' do
			expect{
				put :update, id: @family.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		context 'invalid attributes' do
			before do
				@invalid_attributes = FactoryGirl.attributes_for(:invalid_family)
			end

			it 'should redirect to the edit family form if there are form errors (HTML)' do
				response = put :update, id: @family.id, family: @invalid_attributes
				expect(response).to render_template(:edit)
			end

			it 'should respond with errors in JSON if there are form errors (JSON)' do
				response_json = put :update, id: @family.id, family: @invalid_attributes, format: :json
				response.body.should include "can't be blank"
			end

			it 'should not update the family attributes is invalid' do
				put :update, id: @family.id, family: @invalid_attributes
				@family.reload
				@family.name.should_not be_empty
			end
		end

		context 'valid attributes' do
			before do
				@valid_attributes = FactoryGirl.attributes_for(:family)
				@valid_attributes[:name]+="1"
			end

			it 'should redirect to the family page if the family update was successful (HTML)' do
				response = put :update, id: @family.id, family: @valid_attributes
				expect(response).to redirect_to(family_path(@family))
			end

			it 'should respond with JSON if the family update was ok (JSON)' do
				response = put :update, id: @family.id, family: @valid_attributes, format: :json
				response.status == HTTP_STATUS_CODES[:not_found]
			end
			
			it 'should update the family' do
				put :update, id: @family.id, family: @valid_attributes
				@family.reload
				@family.name.should == @valid_attributes[:name]
			end
		end
	end
end