require "rails_helper"

RSpec.describe Admin::HomeController, type: :controller do
  include Warden::Test::Helpers
  Warden.test_mode!
  Warden.test_reset!

  def login_as(resource)
    # Stub Login
    allow(request.env["warden"]).to receive(:authenticate!).and_return(resource)
    allow(controller).to receive(:current_user).and_return(resource)
  end

  context "Login as Admin" do
    let(:admin) { create(:admin) }
    before(:each) { login_as(admin) }

    describe "GET #index" do
      it "should respond with 200" do
        get :index

        expect(response).to have_http_status(:success)
      end
    end
  end

  context "Login as normal user" do
    let(:user) { create(:user) }
    before(:each) { login_as(user) }

    describe "GET #index" do
      it "should redirect back to root page" do
        get :index

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to root_path
      end
    end
  end

  context "Not logged in as user" do
    describe "GET #index" do
      it "should be redirected to sign_in page" do
        get :index

        expect(response).to have_http_status(:redirect)
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
