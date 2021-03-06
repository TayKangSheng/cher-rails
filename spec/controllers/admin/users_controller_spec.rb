require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.
#
# Also compared to earlier versions of this generator, there are no longer any
# expectations of assigns and templates rendered. These features have been
# removed from Rails core in Rails 5, but can be added back in via the
# `rails-controller-testing` gem.

RSpec.describe Admin::UsersController, type: :controller do
  include Warden::Test::Helpers
  Warden.test_mode!
  Warden.test_reset!

  def login_as(resource)
    # Stub Login
    allow(request.env["warden"]).to receive(:authenticate!).and_return(resource)
    allow(controller).to receive(:current_user).and_return(resource)
  end
  let(:admin) { create(:admin) }

  before(:each) {
    login_as(admin)
  }

  describe "GET #index" do
    it "returns a success response" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    let(:user) { create(:user) }

    it "returns a success response" do
      get :show, params: { id: user.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new

      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    let(:user) { create(:user) }
    it "returns a success response" do
      get :edit, params: { id: user.id }

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new User" do
        expect {
          post :create, params: { user: attributes_for(:user) }
        }.to change(User, :count).by(1)
      end

      it "redirects to the created user" do
        post :create, params: { user: attributes_for(:user) }

        expect(response).to redirect_to(admin_user_path(User.last))
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {user: { email: "error" }}

        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    let(:user) { create(:user) }

    context "with valid params" do
      let(:update_params) {
        {
          password: "updated_#{user.password}",
          password_confirmation: "updated_#{user.password}",
          current_password: user.password
        }
      }

      it "updates the requested admin_user" do
        put :update, params: {id: user.id, user: update_params}

        expect(User.find(user.id).valid_password?(update_params[:password])).to be true
      end

      it "redirects to the admin_user" do
        put :update, params: {id: user.id, user: update_params}

        expect(response).to redirect_to(admin_user_path(user.id))
      end
    end

    context "with invalid params" do
      let(:invalid_params) {
        {
          password: "updated_#{user.password}",
          password_confirmation: "updated_#{user.password}",
          current_password: "wrong password"
        }
      }

      it "returns a success response (i.e. to display the 'edit' template)" do
        put :update, params: {id: user.id, user: invalid_params}

        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    let(:user) { create(:user) }

    it "destroys the requested admin_user" do
      # trigger creation of user tracking change in User.count
      user

      expect {
        delete :destroy, params: {id: user.id}
      }.to change(User, :count).by(-1)
    end

    it "redirects to the admin_users list" do
      delete :destroy, params: {id: user.id}
      expect(response).to redirect_to(admin_users_url)
    end
  end

end
