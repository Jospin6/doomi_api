class PaiementsController < ApplicationController
  before_action :set_paiement, only: %i[ show update destroy ]

  # GET /paiements
  def index
    @paiements = Paiement.all

    render json: @paiements
  end

  # GET /paiements/1
  def show
    render json: @paiement
  end

  # POST /paiements
  def create
    @paiement = Paiement.new(paiement_params)

    if @paiement.save
      render json: @paiement, status: :created, location: @paiement
    else
      render json: @paiement.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /paiements/1
  def update
    if @paiement.update(paiement_params)
      render json: @paiement
    else
      render json: @paiement.errors, status: :unprocessable_entity
    end
  end

  # DELETE /paiements/1
  def destroy
    @paiement.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_paiement
      @paiement = Paiement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def paiement_params
      params.require(:paiement).permit(:transaction_id, :mode, :montant)
    end
end
