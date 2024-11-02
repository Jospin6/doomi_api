class Api::V1::ProduitsController < ApplicationController
  before_action :set_produit, only: %i[ show update destroy ]

  # GET /produits
  def index
    @produits = Produit.all

    render json: @produits
  end

  # GET /produits/1
  def show
    render json: @produit
  end

  # POST /produits
  def create
    @produit = Produit.new(produit_params)

    if @produit.save
      render json: @produit, status: :created, location: @produit
    else
      render json: @produit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /produits/1
  def update
    if @produit.update(produit_params)
      render json: @produit
    else
      render json: @produit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produits/1
  def destroy
    @produit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_produit
      @produit = Produit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produit_params
      params.require(:produit).permit(:titre, :prix, :description, :sub_categorie_produit_id, :images)
    end
end
