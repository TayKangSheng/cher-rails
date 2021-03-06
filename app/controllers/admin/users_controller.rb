class Admin::UsersController < Admin::ApplicationController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/1
  def show
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
  end

  # GET /admin/users/1/edit
  def edit
  end

  # POST /admin/users
  def create
    @admin_user = User.new(admin_user_params)

    if @admin_user.save
      redirect_to admin_user_path(@admin_user), notice: "User was successfully created."
    else
      render :new
    end
  end

  # PATCH/PUT /admin/users/1
  def update
    current_password_provided = @admin_user.valid_password?(update_admin_user_params[:current_password])

    if current_password_provided && @admin_user.update(update_admin_user_params.except(:current_password))
      redirect_to admin_user_path(@admin_user), notice: "User was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /admin/users/1
  def destroy
    @admin_user.destroy!
    redirect_to admin_users_url, notice: "User was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

    # Does not allow email to be changed.
    # Enforce current_password to be provided to update password
    def update_admin_user_params
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end
end
