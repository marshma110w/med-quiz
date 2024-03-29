class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[edit update index]
  before_action :set_user!, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in @user
      flash[:success] = "Добро пожаловать, #{@user.name}!"

      redirect_to quiz_try_url
    else
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = 'Профиль обновлен'
      redirect_to root_path
    else
      render :edit
    end
  end

  def index
    @user = current_user
  end

  private

  def set_user!
    @user = User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :email, :place_of_work, :education, :specialization, :phone_number, :password, :password_confirmation, :old_password)
  end
end
