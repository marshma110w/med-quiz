class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy


  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      log_in user
      flash[:success] = "Добро пожаловать, #{user.name}!"

      redirect_to edit_user_path user
    else
      flash.now[:warning] = "Неправильный логин или пароль!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Вы успешно вышли"
    redirect_to root_path
  end
end
