class Api::V1::CategorieProduitsController < ApplicationController
  before_action :set_categorie_produit, only: %i[ show update destroy ]

  # GET /categorie_produits
  def index
    @categorie_produits = CategorieProduit.includes(sub_categorie_produits: {
      produits: [:vetementChaussure, 
                 :vehicule, 
                 :immobilier, 
                 :evenement, 
                 :emploi, 
                 :autreProduitAttribut]
  }).all

    render json: @categorie_produits
  end

  # GET /categorie_produits/1
  def show
    render json: @categorie_produit
  end

  # POST /categorie_produits
  def create
    @categorie_produit = CategorieProduit.new(categorie_produit_params)

    if @categorie_produit.save
      render json: @categorie_produit, status: :created
    else
      render json: @categorie_produit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categorie_produits/1
  def update
    if @categorie_produit.update(categorie_produit_params)
      render json: @categorie_produit
    else
      render json: @categorie_produit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /categorie_produits/1
  def destroy
    @categorie_produit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_categorie_produit
      @categorie_produit = CategorieProduit.includes(sub_categorie_produits: {
        produits: [:vetementChaussure, 
                   :vehicule, 
                   :immobilier, 
                   :evenement, 
                   :emploi, 
                   :autreProduitAttribut]
    }).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorie_produit_params
      params.require(:categorie_produit).permit(:titre, :description, :image)
    end
end
