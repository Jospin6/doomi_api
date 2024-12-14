class ApplicationController < ActionController::API
    include ActionController::MimeResponds

    before_action :set_cors_headers
    before_action :configure_devise_parameters, if: :devise_controller?
    def configure_devise_parameters
        devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:username, :phone_number, :password, :role, :password_confirmation, :is_active)}
    end

  private

  def set_cors_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Authorization'
  end

end
