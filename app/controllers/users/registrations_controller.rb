# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  def create
    build_resource

    if resource.save
      UserMailer.confirmation_email(resource).deliver_now
      render json: { message: 'Utilisateur créé. Vérifiez votre e-mail pour le code de confirmation.' }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  # def respond_with(resource, options={})
  #   if resource.persisted?
  #     render json: {
  #       code: 200,
  #       message: 'signed up successfully',
  #       data: resource
  #     }, status: :ok
  #   else
  #     render json: {
  #       message: 'User could not be created successfully',
  #       errors: resource.errors.full_messages
  #     }, status: :unprocessable_entity     
  #   end
  # end 
end
