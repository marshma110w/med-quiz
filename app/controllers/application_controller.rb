class ApplicationController < ActionController::Base
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
  end

  def user_signed_in?
    current_user.present?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    session.delete :user_id
    @current_user = nil
  end

  def require_no_authentication
    return unless user_signed_in?

    flash[:warning] = 'Вы уже вошли'
    redirect_to edit_user_path(current_user)
  end

  def require_authentication
    return if user_signed_in?

    flash[:warning] = 'Вы не вошли'

    redirect_to new_session_path
  end

  helper_method :current_user, :user_signed_in?
end
