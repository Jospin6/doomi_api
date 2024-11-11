class Api::V1::CoordonnesController < ApplicationController
    before_action :set_coordonne, only: %i[ show update destroy ]
  
    # GET /coordonnes
    def index
      @coordonnes = Coordonne.all
  
      render json: @coordonnes
    end
  
    # GET /coordonnes/1
    def show
      render json: @coordonne
    end

    def user_coordonne
        @coordonne = Coordonne.find_by("user_id", current_user.id)
        render json: @coordonne, status: :ok
    end
  
    # POST /coordonnes
    def create
      @coordonne = Coordonne.new(coordonne_params)
  
      if @coordonne.save
        render json: @coordonne, status: :created
      else
        render json: @coordonne.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /coordonnes/1
    def update
      if @coordonne.update(coordonne_params)
        render json: @coordonne
      else
        render json: @coordonne.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /coordonnes/1
    def destroy
      @coordonne.destroy
    end
  
    private

    # Use callbacks to share common setup or constraints between actions.
    def set_coordonne
        @coordonne = Coordonne.find(params[:id])
    end
  
    # Only allow a list of trusted parameters through.
    def coordonne_params
        params.require(:coordonne).permit(:user_id, :ville, :pays, :lat_lon)
    end
end
  