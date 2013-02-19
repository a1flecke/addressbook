require 'spec_helper'

include Rack::Utils

describe CommentsController do
	describe 'GET #index' do
		context 'no comments' do
			before do
				@response = get :index , :family_id=>1
			end

			it 'should assign the collection' do
				assigns(:comments).should eq []
			end
			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end
			it 'should render JSON properly' do
				response_json = get :index, :family_id=>1, :format=>:json
				response_json.body.should == "[]"
			end
		end
		context 'there are comments' do
			before do
				@comment = FactoryGirl.create(:comment)
				@family = FactoryGirl.create(:family, comments: [@comment])
				response = get :index , :family_id=>@family.id
			end

			it 'should assign the collection' do
				assigns(:comments).should eq [@comment]
			end

			it 'should render html properly' do
				expect(@response).to render_template(:index)
			end

			it 'should render JSON properly' do
				response_json = get :index, :family_id=>@family.id, :format=>:json
				response_json.body.should include(@comment.value)
			end
		end
	end

	describe '#show' do
		before do
			@comment = FactoryGirl.create(:comment)
			@family = FactoryGirl.create(:family, comments: [@comment])
		end

		it 'should throw an RecordNotFound if the comment is not found (by id)' do
			expect{
				response = get :show , :family_id=>@family.id, :id=>@comment.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should render HTML properly' do
			response = get :show , :family_id=>@family.id, :id=>@comment.id
			expect(@response).to render_template(:show)
		end

		it 'should render JSON properly' do
			response_json = get :show, :family_id=>@family.id, :id=>@comment.id, :format=>:json
			response_json.body.should include(@comment.value)
		end
	end

	describe '#new' do
		it 'should render HTML properly' do
			response = get :new, family_id: 1
			expect(@response).to render_template(:new)
		end

		it 'should render JSON properly' do
			response = get :new, family_id: 1, format: :json
			response.body.should include "value"
		end

		it 'should assign the comment' do
			response = get :new, family_id: 1
			assigns(:comment).should_not be_nil
		end
	end

	describe '#edit' do
		before do
			@comment = FactoryGirl.create(:comment)
			@family = FactoryGirl.create(:family, comments: [@comment])
		end

		it 'should throw an RecordNotFound if the comment is not found (by id)' do
			expect{
				response = get :edit , :family_id=>@family.id, :id=>@comment.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should redirect to the edit comment form' do
			response = get :edit, family_id: @family.id, id: @comment.id
			expect(@response).to render_template(:edit)
		end
	end

	describe '#create' do
		before do
			@family = FactoryGirl.create(:family)
		end

		it 'should throw an RecordNotFound if the family is not found (by id)' do
			expect{
				response = post :create, family_id: @family.id+1, comment: FactoryGirl.attributes_for(:comment)
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		context 'valid comment attributes' do
			before do
				@valid_attributes = FactoryGirl.attributes_for(:comment)
			end
			
			it 'should create a comment if everything is ok' do
				expect{
					post :create, family_id: @family.id, comment: @valid_attributes
				}.to change(Comment,:count)
			end

			it 'should redirect to the family path if everything is ok (HTML)' do
				response = post :create, family_id: @family.id, comment: @valid_attributes
				expect(response).to redirect_to(family_path(@family))
			end
			it 'should respond with JSON if everything is ok (JSON)' do
				response = post :create, family_id: @family.id, comment: @valid_attributes, format: :json
				response.status == HTTP_STATUS_CODES[:not_found]
			end
		end

		context 'invalid comment attributes' do
			before do
				@invalid_attributes = FactoryGirl.attributes_for(:invalid_comment)
			end
			
			it 'should not create save the comment if there are invalid comment attributes' do
				expect{
					post :create, family_id: @family.id, comment: @invalid_attributes
				}.to_not change(Comment,:count)
			end

			it 'should redirect to the new comment form if there are form errors (HTML)' do
				response = post :create, family_id: @family.id, comment: @invalid_attributes
				expect(response).to render_template(:new)
			end

			it 'should respond with errors in JSON if there are form errors (JSON)' do
				response = post :create, family_id: @family.id, comment: @invalid_attributes, format: :json
				response.body.should include "can't be blank"
			end
		end
	end

	describe '#update' do
		before do
			@comment = FactoryGirl.create(:comment)
			@family = FactoryGirl.create(:family, comments: [@comment])
		end

		it 'should throw an RecordNotFound if the comment is not found (by id)' do
			expect{
				put :update, family_id: @family.id, id: @comment.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should throw an RecordNotFound if the family was not found' do
			expect{
				put :update, family_id: @family.id+1, id: @comment.id
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		context 'invalid attributes' do
			before do
				@invalid_attributes = FactoryGirl.attributes_for(:invalid_comment)
			end

			it 'should redirect to the edit comment form if there are form errors (HTML)' do
				response = put :update, family_id: @family, id: @comment.id,  comment: @invalid_attributes
				expect(response).to render_template(:edit)
			end

			it 'should respond with errors in JSON if there are form errors (JSON)' do
				response_json = put :update, family_id: @family.id, id: @comment.id, comment: @invalid_attributes, format: :json
				response.body.should include "can't be blank"
			end

			it 'should not update the comment attributes is invalid' do
				put :update, family_id: @family.id, id: @comment.id, comment: @invalid_attributes
				@comment.reload
				@comment.value.should_not be_empty
			end
		end

		context 'valid attributes' do
			before do
				@valid_attributes = FactoryGirl.attributes_for(:comment)
				@valid_attributes[:value]+="1"
			end

			it 'should redirect to the family page if the comment update was successful (HTML)' do
				response = put :update, family_id: @family.id, id: @comment.id, comment: @valid_attributes
				expect(response).to redirect_to(family_path(@family))
			end

			it 'should respond with JSON if the comment update was ok (JSON)' do
				response = put :update, family_id: @family.id, id: @comment, comment: @valid_attributes, format: :json
				response.status == HTTP_STATUS_CODES[:not_found]
			end
			
			it 'should update the comment' do
				put :update, family_id: @family.id, id: @comment.id, comment: @valid_attributes
				@comment.reload
				@comment.value.should == @valid_attributes[:value]
			end
		end
	end

	describe '#destroy' do
		before do
			@comment = FactoryGirl.create(:comment)
			@family = FactoryGirl.create(:family, comments: [@comment])
		end

		it 'should throw an RecordNotFound if the comment is not found (by id)' do
			expect{
				post :destroy, family_id: @family.id, id: @comment.id+1
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should throw an RecordNotFound if the family was not found' do
			expect{
				post :destroy, family_id: @family.id+1, id: @comment.id
			}.to raise_error(ActiveRecord::RecordNotFound)
		end

		it 'should still delete the comment if the family was not found' do
			expect{
				begin
					post :destroy, family_id: @family.id+1, id: @comment.id
				rescue ActiveRecord::RecordNotFound
				end
			}.to change(Comment,:count)
		end

		it 'should delete if everything is rosy' do
			expect{
				post :destroy, family_id: @family.id, id: @comment.id
			}.to change(Comment,:count)
		end

		it 'should redirect to the family page if the comment update was successful (HTML)' do
			response = post :destroy, family_id: @family.id, id: @comment.id
			expect(response).to redirect_to(family_path(@family))
		end

		it 'should respond with JSON if the family was found' do
			response_json = post :destroy, family_id: @family.id, id: @comment.id, format: :json
			response_json.status == HTTP_STATUS_CODES[:not_found]
		end
	end
end