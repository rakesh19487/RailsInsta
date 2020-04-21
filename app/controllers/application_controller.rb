class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :authenticate_user!






    protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end


    def after_sign_out_path_for(resource_or_scope)
      p "lllllllllllllllllllllllllllllllllllll"
      p resource_or_scope
      p "lllllllllllllllllllllllllllllllllllll"
      root_path
    end
end
