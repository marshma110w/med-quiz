class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy


  def new
  end

  def create
    user = User.find_by email: params[:email]
    if user&.authenticate(params[:password])
      sign_in user
      flash[:success] = "welcome, #{user.name}!"
      redirect_to edit_user_path user
    else
      flash.now[:warning] = "Incorrect email/password!"
      render :new
    end
  end

  def destroy
    sign_out
    flash[:success] = "Signed out"
    redirect_to root_path
  end
end