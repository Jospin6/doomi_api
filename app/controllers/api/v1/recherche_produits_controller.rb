class Api::V1::RechercheProduitsController < ApplicationController
  before_action :set_recherche_produit, only: %i[ show update destroy ]

  # GET /recherche_produits
  def index
    @recherche_produits = RechercheProduit.all

    render json: @recherche_produits
  end

  # GET /recherche_produits/1
  def show
    render json: @recherche_produit
  end

  # POST /recherche_produits
  def create
    @recherche_produit = RechercheProduit.new(recherche_produit_params)

    if @recherche_produit.save
      render json: @recherche_produit, status: :created
    else
      render json: @recherche_produit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recherche_produits/1
  def update
    if @recherche_produit.update(recherche_produit_params)
      render json: @recherche_produit
    else
      render json: @recherche_produit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recherche_produits/1
  def destroy
    @recherche_produit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recherche_produit
      @recherche_produit = RechercheProduit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recherche_produit_params
      params.require(:recherche_produit).permit(:libele, :user_id, :date_heure, :resultats, :localisation)
    end
end
