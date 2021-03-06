require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

	describe "Get new" do
		it "returns http success" do
			get :new
			expect(response).to have_http_status(:success)
		end
	end

	describe "get create" do
		it "returns http success" do
			get :create
			expect(response).to have_http_status(:success)
		end
	end


end