class ApplicationController < ActionController::Base

  
  protect_from_forgery with: :exception
  
  before_action :update_allowed_parameters, if: :devise_controller?
  # before_action :authenticate_user!
  
  
  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :surname, :email, :password, :password_confirmation)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :surname, :email, :password, :current_password)
    end
  end
  
  rescue_from CanCan::AccessDenied do | exception |
  redirect_to root_url, alert: exception.message
  end
  # Catch all CanCan errors and alert the user of the exception
  
end
