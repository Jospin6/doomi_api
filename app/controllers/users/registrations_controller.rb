# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
  if resource.persisted?
    # Créez le token ici, par exemple avec JWT
    token = generate_token(resource) 
    
    Coordonne.create(user_id: resource.id, ville: params[:ville], pays: params[:pays], lat_lon: params[:lat_lon])
    
    render json: {
      code: 200,
      message: 'signed up successfully',
      data: resource,
      token: token 
    }, status: :ok
  else
    logger.error("User creation failed: #{resource.errors.full_messages}")
    render json: {
      message: 'User could not be created successfully',
      errors: resource.errors.full_messages
    }, status: :unprocessable_entity     
  end
  end

  def generate_token(user)
    payload = { user_id: user.id }
    JWT.encode(payload, Rails.application.secrets.secret_key_base)
  end
end
