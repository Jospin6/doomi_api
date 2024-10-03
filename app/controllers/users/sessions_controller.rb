# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_for_database_authentication(email: params[:email])
    if user&.valid_password?(params[:password])
      if user.confirmed?
        sign_in(user)
        render json: { message: 'User signed in successfully.' }, status: :ok
      else
        render json: { error: 'Votre compte n\'est pas encore confirmé. Veuillez vérifier votre e-mail.' }, status: :unauthorized
      end
    else
      render json: { error: 'Identifiants invalides.' }, status: :unauthorized
    end
  end

  private

  # def respond_with(resource, options={})
  #   render json: {
  #     code: 200, message: "User signed in successfully",
  #     data: current_user
  #   }, status: :ok
  # end
  
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
end
