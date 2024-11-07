class RestaurationsController < ApplicationController
  before_action :set_restauration, only: %i[ show update destroy ]

  # GET /restaurations
  def index
    @restaurations = Restauration.all

    render json: @restaurations
  end

  # GET /restaurations/1
  def show
    render json: @restauration
  end

  # POST /restaurations
  def create
    @restauration = Restauration.new(restauration_params)

    if @restauration.save
      render json: @restauration, status: :created, location: @restauration
    else
      render json: @restauration.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /restaurations/1
  def update
    if @restauration.update(restauration_params)
      render json: @restauration
    else
      render json: @restauration.errors, status: :unprocessable_entity
    end
  end

  # DELETE /restaurations/1
  def destroy
    @restauration.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restauration
      @restauration = Restauration.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restauration_params
      params.require(:restauration).permit(:nom, :type_cuisine, :adresse, :contacts, :site_web, :capacite, :horaires, :type_services, :localisation, :user_id)
    end
end
