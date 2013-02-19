require 'spec_helper'

include Rack::Utils

describe EmailsController do
	describe 'GET #index' do
		context 'no emails' do
			before do
				@response = get :index , :family_id=>1, :person_id => 1
			end

			it 'should assign the collection' do
				assigns(:emails).should eq []
			end
			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end
			it 'should render JSON properly' do
				response_json = get :index, :family_id=>1, :person_id=> 1, :format=>:json
				response_json.body.should == "[]"
			end
		end
		context 'there are emails' do
			before do
				@email = FactoryGirl.create(:email)
				@person = FactoryGirl.create(:person, emails: [@email])
				@family = FactoryGirl.create(:family, people: [@person])
				response = get :index , :family_id=>@family.id, :person_id=>@person.id
			end

			it 'should assign the collection' do
				assigns(:emails).should eq [@email]
			end

			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end

			it 'should render JSON properly' do
				response_json = get :index, :family_id=>@family.id, person_id:@person.id, :format=>:json
				response_json.body.should include(@email.value)
			end
		end
	end

	describe '#show' do
		before do
			@email = FactoryGirl.create(:email)
			@person = FactoryGirl.create(:person, emails: [@email])
			@family = FactoryGirl.create(:family, people: [@person])
		end

		it 'should throw an RecordNotFound if the email is not found (by id)' do
			expect{
				response = get :show , :family_id=>@family.id, person_id: @person.id, :id=>@email.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should render HTML properly' do
			response = get :show , :family_id=>@family.id, person_id: @person.id, :id=>@email.id
			expect(@response).to render_template(:show)
		end

		it 'should render JSON properly' do
			response_json = get :show, :family_id=>@family.id, person_id: @person.id, :id=>@email.id, :format=>:json
			response_json.body.should include(@email.value)
		end
	end

	describe '#new' do
		it 'should render HTML properly' do
			response = get :new, family_id: 1, person_id: 1
			expect(@response).to render_template(:new)
		end

		it 'should render JSON properly' do
			response = get :new, family_id: 1, person_id: 1, format: :json
			response.body.should include "value"
		end

		it 'should assign the email' do
			response = get :new, family_id: 1, person_id: 1
			assigns(:email).should_not be_nil
		end
	end

	describe '#edit' do
		before do
			@email = FactoryGirl.create(:email)
			@person = FactoryGirl.create(:person, emails: [@email])
			@family = FactoryGirl.create(:family, people: [@person])
		end

		it 'should throw an RecordNotFound if the email is not found (by id)' do
			expect{
				response = get :edit , :family_id=>@family.id, person_id: @person.id, :id=>@email.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should redirect to the edit email form' do
			response = get :edit, family_id: @family.id, person_id: @person.id, id: @email.id
			expect(@response).to render_template(:edit)
		end
	end
end