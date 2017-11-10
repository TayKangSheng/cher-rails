class Admin::ApplicationController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin?

  def is_admin?
    unless current_user.has_role? :admin
      flash[:alert] = "Unauthorized access."
      redirect_to root_path
    end
  end
end
