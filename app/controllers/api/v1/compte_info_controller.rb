class Api::V1::CompteInfoController < ApplicationController

    def confirm_code
        @user = User.find_by(email: params[:email])
        if @user && @user.compte_info.confirmation_code == params[:confirmation_code]
          @user.compte_info.update(confirmed_at: Time.current) 
          render json: { message: 'Votre compte a été confirmé!' }, status: :ok
        else
          render json: { error: 'Code de confirmation invalide.' }, status: :unprocessable_entity
        end
    end
    
    def resend_confirmation_code
        @user = User.find_by(email: params[:email])
        if @user
            @user.update_confirmation_code
            UserMailer.confirmation_email(@user).deliver_now
            render json: { message: 'Un nouveau code de confirmation a été envoyé à votre e-mail.' }, status: :ok
        else
            render json: { error: 'Aucun utilisateur trouvé avec cet e-mail.' }, status: :not_found
        end
    end

    def user_coordonne
      @coordonne = Coordonne.find_by("user_id", current_user.id)
      render json: @coordonne, status: :ok
    end
    

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_compte_info
      @favorie_produit = CompteInfo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def compte_info_params
      params.require(:compte_info).permit(:user_id, :confirmation_code, :confirmed_at, :rccm, :langue)
    end
end