# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.is_active
      token = current_token(resource) 
      render json: {
        code: 200,
        message: "User signed in successfully",
        data: current_user,
        token: token
      }, status: :ok
    else
      render json: {
        code: 403,
        message: "Access denied",
        errors: ["User is not active or account is not confirmed"]
      }, status: :forbidden
    end
  end
  
  def respond_to_on_destroy
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1], Rails.application.credentials.fetch(:secret_key_base)).first
    current_user = User.find(jwt_payload['sub'])
    if current_user
      render json: {
        status: 200,
        message: "User signed out"
      }, status: :ok
    else
      render json: {
        status: 401,
        message: "User has no active session"
      }, status: :unauthorized
    end
  end

  def current_token(resource)
    Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
  end
end
