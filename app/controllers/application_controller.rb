class ApplicationController < ActionController::API
    before_action :configure_devise_parameters, if: :devise_controller?
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :email, :phone_number, :password, :type_account, :role, :password_confirmation, :is_active)}
    end

end
