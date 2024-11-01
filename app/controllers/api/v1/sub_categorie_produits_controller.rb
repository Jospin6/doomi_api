class Api::V1::SubCategorieProduitsController < ApplicationController
  before_action :set_sub_categorie_produit, only: %i[ show update destroy ]

  # GET /sub_categorie_produits
  def index
    @sub_categorie_produits = SubCategorieProduit.all

    render json: @sub_categorie_produits
  end

  # GET /sub_categorie_produits/1
  def show
    render json: @sub_categorie_produit
  end

  # POST /sub_categorie_produits
  def create
    @sub_categorie_produit = SubCategorieProduit.new(sub_categorie_produit_params)

    if @sub_categorie_produit.save
      render json: @sub_categorie_produit, status: :created, location: @sub_categorie_produit
    else
      render json: @sub_categorie_produit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sub_categorie_produits/1
  def update
    if @sub_categorie_produit.update(sub_categorie_produit_params)
      render json: @sub_categorie_produit
    else
      render json: @sub_categorie_produit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sub_categorie_produits/1
  def destroy
    @sub_categorie_produit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_categorie_produit
      @sub_categorie_produit = SubCategorieProduit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sub_categorie_produit_params
      params.require(:sub_categorie_produit).permit(:categorie_produit_id, :titre)
    end
end
