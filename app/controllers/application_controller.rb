class ApplicationController < ActionController::API
    before_action :configure_devise_parameters, if: :devise_controller?
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :phone_number, :password, :role, :password_confirmation, :is_active)}
    end

end
