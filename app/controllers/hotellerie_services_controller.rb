class HotellerieServicesController < ApplicationController
  before_action :set_hotellerie_service, only: %i[ show update destroy ]

  # GET /hotellerie_services
  def index
    @hotellerie_services = HotellerieService.all

    render json: @hotellerie_services
  end

  # GET /hotellerie_services/1
  def show
    render json: @hotellerie_service
  end

  # POST /hotellerie_services
  def create
    @hotellerie_service = HotellerieService.new(hotellerie_service_params)

    if @hotellerie_service.save
      render json: @hotellerie_service, status: :created, location: @hotellerie_service
    else
      render json: @hotellerie_service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /hotellerie_services/1
  def update
    if @hotellerie_service.update(hotellerie_service_params)
      render json: @hotellerie_service
    else
      render json: @hotellerie_service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /hotellerie_services/1
  def destroy
    @hotellerie_service.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hotellerie_service
      @hotellerie_service = HotellerieService.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hotellerie_service_params
      params.require(:hotellerie_service).permit(:nom_hotel, :type_hebergement, :adresse, :contacts, :email, :site_web, :nombre_chambres, :capacite_accueil, :tarif_moyen, :horaires, :localisation, :user_id)
    end
end
