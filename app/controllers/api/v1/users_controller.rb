class Api::V1::UsersController < ApplicationController
  def confirm_code
    @user = User.find_by(email: params[:email])
    if @user && @user.confirmation_code == params[:confirmation_code]
      @user.update(confirmed_at: Time.current) 
      render json: { message: 'Votre compte a été confirmé!' }, status: :ok
    else
      render json: { error: 'Code de confirmation invalide.' }, status: :unprocessable_entity
    end
  end

  def resend_confirmation_code
      @user = User.find_by(email: params[:email])
      if @user
        @user.generate_confirmation_code
        @user.save
        UserMailer.confirmation_email(@user).deliver_now
        render json: { message: 'Un nouveau code de confirmation a été envoyé à votre e-mail.' }, status: :ok
      else
        render json: { error: 'Aucun utilisateur trouvé avec cet e-mail.' }, status: :not_found
      end
  end
end