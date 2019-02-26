class ApplicationController < ActionController::Base
	protect_from_forgery prepend: true
	before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
  	attributes = [:email, :shg_name, :password, :password_confirmation]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end

  private
  def after_sign_in_path_for(resource)
  	if current_user
  		"/dashboard/index"
  	end
  end
end
