class Api::V1::ServicesDisponibleHotelsController < ApplicationController
  before_action :set_services_disponible_hotel, only: %i[ show update destroy ]

  # GET /services_disponible_hotels
  def index
    @services_disponible_hotels = ServicesDisponibleHotel.all

    render json: @services_disponible_hotels
  end

  # GET /services_disponible_hotels/1
  def show
    render json: @services_disponible_hotel
  end

  # POST /services_disponible_hotels
  def create
    @services_disponible_hotel = ServicesDisponibleHotel.new(services_disponible_hotel_params)

    if @services_disponible_hotel.save
      render json: @services_disponible_hotel, status: :created, location: @services_disponible_hotel
    else
      render json: @services_disponible_hotel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services_disponible_hotels/1
  def update
    if @services_disponible_hotel.update(services_disponible_hotel_params)
      render json: @services_disponible_hotel
    else
      render json: @services_disponible_hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services_disponible_hotels/1
  def destroy
    @services_disponible_hotel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_services_disponible_hotel
      @services_disponible_hotel = ServicesDisponibleHotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def services_disponible_hotel_params
      params.require(:services_disponible_hotel).permit(:hotellerie_service_id, :nom_service, :description, :statut, :cout)
    end
end
