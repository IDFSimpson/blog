require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  describe "#new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template(:new)
    end

    it "assigns a new user variable" do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  describe "#create" do
    def valid_request
      post :create, user: FactoryGirl.attributes_for(:user)
    end

    describe "with valid attributes" do

      it "redirects to the home page" do
        valid_request
        expect(response).to redirect_to(root_path)
      end

      it "adds the new user to session" do
        valid_request
        expect(session[:user_id]).to eq(User.last.id)
      end

      it "adds a record to the database" do
        expect { valid_request }.to change { User.count }.by(1)
      end

      it "redirects_to the home page" do
        valid_request
        expect(response).to redirect_to root_path
      end
    end

    describe "with invalid attributes" do
      def invalid_request
        post :create, user: FactoryGirl.attributes_for(:user).merge(email: nil)
      end

      it "doesn't add a user to session" do
        invalid_request
        expect(session[:user_id]).to eq(nil)
      end

      it "doesn't add a record to the database" do
        expect { invalid_request }.to change { User.count }.by(0)
      end

      it "renders the new template" do
        invalid_request
        expect(response).to render_template(:new)
      end

    end
  end
end
