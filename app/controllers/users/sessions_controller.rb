# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :set_route
  skip_before_filter :user_from_subdomain

    def new
      self.resource = resource_class.new(sign_in_params)
      store_location_for(resource, params[:redirect_to])
      super
    end

    def session_timeout
    session[:current_user_id] = nil
    reset_session
    flash[:notice] = "You have been logged out due to inactivity. Please login again."
    redirect_to "devise/sessions#new"
  end

    private

    def set_route
      @route = request.path.split('/')[0]
    end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
