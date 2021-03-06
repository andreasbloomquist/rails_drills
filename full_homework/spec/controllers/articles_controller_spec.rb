require 'rails_helper'

RSpec.describe ArticlesController, :type => :controller do
	
	describe "get index" do
		it "returns http success" do
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe "get new" do
		it "returns http success" do
			get :new
			expect(response).to have_http_status(:success)
		end
	end
end

