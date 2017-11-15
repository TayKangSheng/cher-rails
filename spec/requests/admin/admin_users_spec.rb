require "rails_helper"

RSpec.describe "Admin:Users", type: :request do
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  context "Logged in as Normal User" do
    before(:each) { log_in(user) }

    it "GET /admin/users should redirect" do
      get admin_users_path

      expect(response).to have_http_status(302)
    end

    it "POST /admin/users should return 302" do
      post admin_users_path, params: { user: attributes_for(:user) }

      expect(response).to have_http_status(302)
    end

    it "GET /admin/users/new should return 302" do
      get new_admin_user_path

      expect(response).to have_http_status(302)
    end

    it "GET /admin/users/:id/edit should return 302" do
      get edit_admin_user_path(id: user.id)

      expect(response).to have_http_status(302)
    end

    it "GET /admin/users/:id should return 302" do
      get admin_user_path(id: user.id)

      expect(response).to have_http_status(302)
    end

    it "PATCH /admin/users/:id should return 302" do
      update_params = {
        password: "#{user.password}_updated",
        password_confirmation: "#{user.password}_updated",
        current_password: user.password
      }
      patch admin_user_path(id: user.id), params: { user: update_params }

      expect(response).to have_http_status(302)
    end

    it "PUT /admin/users/:id should return 302" do
      update_params = {
        password: "#{user.password}_updated",
        password_confirmation: "#{user.password}_updated",
        current_password: user.password
      }
      put admin_user_path(id: user.id), params: { user: update_params }

      expect(response).to have_http_status(302)
    end

    it "DELETE /admin/users/:id should return 302" do
      delete admin_user_path(id: user.id)

      expect(response).to have_http_status(302)
    end
  end

  context "Logged in as Admin User" do
    before(:each) { log_in(admin) }

    it "GET /admin/users should return 200" do
      get admin_users_path

      expect(response).to have_http_status(200)
    end

    it "POST /admin/users should return 302" do
      post admin_users_path, params: { user: attributes_for(:user) }

      expect(response).to have_http_status(302)
    end

    it "GET /admin/users/new should return 200" do
      get new_admin_user_path

      expect(response).to have_http_status(200)
    end

    it "GET /admin/users/:id/edit should return 200" do
      get edit_admin_user_path(id: user.id)

      expect(response).to have_http_status(200)
    end

    it "GET /admin/users/:id should return 200" do
      get admin_user_path(id: user.id)

      expect(response).to have_http_status(200)
    end

    it "PATCH /admin/users/:id should return 302" do
      update_params = {
        password: "#{user.password}_updated",
        password_confirmation: "#{user.password}_updated",
        current_password: user.password
      }
      patch admin_user_path(id: user.id), params: { user: update_params }

      expect(response).to have_http_status(302)
    end

    it "PUT /admin/users/:id should return 302" do
      update_params = {
        password: "#{user.password}_updated",
        password_confirmation: "#{user.password}_updated",
        current_password: user.password
      }
      put admin_user_path(id: user.id), params: { user: update_params }

      expect(response).to have_http_status(302)
    end

    it "DELETE /admin/users/:id should return 302" do
      delete admin_user_path(id: user.id)

      expect(response).to have_http_status(302)
    end
  end
end
