class Api::V1::VitrinesController < ApplicationController
  before_action :set_vitrine, only: %i[ show update destroy ]

  # GET /vitrines
  def index
    @vitrines = Vitrine.all

    render json: @vitrines
  end

  # GET /vitrines/1
  def show
    render json: @vitrine
  end

  def user_vitrine
    @vitrine = Vitrine.includes(:follewers)
                   .where(user_id: current_user.id)
                   .first

    @followers_count = vitrine.follewers.count if @vitrine

    render json: {
      vitrine: @vitrine,
      followers_count: @followers_count
    }
  end
  

  # POST /vitrines
  def create
    @vitrine = Vitrine.new(vitrine_params)

    if @vitrine.save
      render json: @vitrine, status: :created
    else
      render json: @vitrine.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vitrines/1
  def update
    if @vitrine.update(vitrine_params)
      render json: @vitrine
    else
      render json: @vitrine.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vitrines/1
  def destroy
    @vitrine.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vitrine
      @vitrine = Vitrine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vitrine_params
      params.require(:vitrine).permit(:titre, :description, :profil_img, :cover_img, :specialites, :horaires)
    end
end
