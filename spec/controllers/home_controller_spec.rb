require 'rails_helper'

describe HomeController do 
	describe 'get #index ' do
		it 'should render index' do
			get :index
			response.should render_template :index
		end
	end

	describe 'get #show' do
		it 'should response depends on category id and output documents of this category' do
			category = FactoryGirl.create(:category)
			document = FactoryGirl.create(:document)
			document2 = FactoryGirl.create(:document)
			category.documents << document 
			get :show, id: category
			assigns(:documents).should include(document)
			assigns(:documents).should_not include(document2)
		end
	end

	describe 'get #smq' do
		it 'should output only documents with open = true' do
			document = Document.create!(name: "hello world", doc_path: "upload")
			document_with = Document.create!(name: "hello world", doc_path: "upload", open: true)
			get :smq
			assigns(:documents).should_not include(document)
			assigns(:documents).should include(document_with)
 		end
	end

	describe 'get #external' do
		it 'should render external template' do
			get :external
			response.should render_template :external
		end
	end

	describe 'get #administration' do
		it 'should render admin layout' do
			  @request.env["devise.mapping"] = Devise.mappings[:admin]
	    	sign_in FactoryGirl.create(:admin)
	    	get :administration
	    	response.should render_template(:layout => 'admin')
 		end
	end
end