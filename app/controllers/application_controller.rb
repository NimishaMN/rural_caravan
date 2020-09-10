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
      # if current_user.subscription_end_date.present?
      #   if current_user.subscription_end_date < Time.now.to_date
      #     "/billings"
      #   else
  		    "/dashboard/index"
      #   end
      # else
      #   "/billings"
      # end
  	elsif current_admin
      "/admin/dashboard"
    end

  end

  def user_from_subdomain
    if session[:user_id].present?
      @user ||= User.find(session[:user_id])
    else
      redirect_to(controller: :login, action: :session_timeout)
    end  
  end
end
