class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include CanCan::ControllerAdditions

  def current_user
     @user ||=User.find(session[:user_id]) if user_sign_in?

  end
  helper_method "current_user"

  helper_method 'current_user'

  def user_sign_in?
    session[:user_id].present?
  end
  helper_method 'user_sign_in?'

  def authenticate_user
  redirect_to new_session_path,alert: "please sign in" unless user_sign_in?
  end
  helper_method 'authenticate_user'



end
