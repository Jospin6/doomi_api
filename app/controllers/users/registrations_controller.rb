# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
  if resource.persisted?
    
    token = current_token(resource) 
    
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

  def current_token(resource)
    Warden::JWTAuth::UserEncoder.new.call(resource, :user, nil).first
  end
end
