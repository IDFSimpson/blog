require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  # describe "#new" do
  #   get :new
  # end

  describe "#create" do
    def valid_request
      post :create, user: FactoryGirl.attributes_for(:user)
    end

    describe "with valid attributes" do
      it "adds user to session"

      it "redirects_to the root path" do
        valid_request
        expect(response).to redirect_to root_path
      end
    end

    describe "with invalid attributes" do
      it "doesn't add a user to session"

      it "redirects_to the root path" do
        expect(response).to render_template :new
      end
    end
  end
end
