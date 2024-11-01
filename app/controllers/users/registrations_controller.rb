# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      UserMailer.confirmation_email(resource).deliver_now
      render json: {
        code: 200,
        message: 'signed up successfully',
        data: resource
      }, status: :ok
    else
      render json: {
        message: 'User could not be created successfully',
        errors: resource.errors.full_messages
      }, status: :unprocessable_entity     
    end
  end 
end
