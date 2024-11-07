class Api::V1::SericesDisponibleHotelsController < ApplicationController
  before_action :set_serices_disponible_hotel, only: %i[ show update destroy ]

  # GET /serices_disponible_hotels
  def index
    @serices_disponible_hotels = SericesDisponibleHotel.all

    render json: @serices_disponible_hotels
  end

  # GET /serices_disponible_hotels/1
  def show
    render json: @serices_disponible_hotel
  end

  # POST /serices_disponible_hotels
  def create
    @serices_disponible_hotel = SericesDisponibleHotel.new(serices_disponible_hotel_params)

    if @serices_disponible_hotel.save
      render json: @serices_disponible_hotel, status: :created, location: @serices_disponible_hotel
    else
      render json: @serices_disponible_hotel.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /serices_disponible_hotels/1
  def update
    if @serices_disponible_hotel.update(serices_disponible_hotel_params)
      render json: @serices_disponible_hotel
    else
      render json: @serices_disponible_hotel.errors, status: :unprocessable_entity
    end
  end

  # DELETE /serices_disponible_hotels/1
  def destroy
    @serices_disponible_hotel.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_serices_disponible_hotel
      @serices_disponible_hotel = SericesDisponibleHotel.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def serices_disponible_hotel_params
      params.require(:serices_disponible_hotel).permit(:hotellerie_service_id, :nom_service, :description, :statut, :cout)
    end
end
