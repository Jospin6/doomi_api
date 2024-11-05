class Api::V1::FavorieProduitsController < ApplicationController
  before_action :set_favorie_produit, only: %i[ show update destroy ]

  # GET /favorie_produits
  def index
    @favorie_produits = FavorieProduit.all

    render json: @favorie_produits
  end

  # GET /favorie_produits/1
  def show
    render json: @favorie_produit
  end

  def user_favories
    @favorie_produits = FavorieProduit.includes(:produit).find_by("user_id", current_user.id)
    render json: @favorie_produits, status: :ok
  end
  

  # POST /favorie_produits
  def create
    @favorie_produit = FavorieProduit.new(favorie_produit_params)

    if @favorie_produit.save
      render json: @favorie_produit, status: :created
    else
      render json: @favorie_produit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /favorie_produits/1
  def update
    if @favorie_produit.update(favorie_produit_params)
      render json: @favorie_produit
    else
      render json: @favorie_produit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /favorie_produits/1
  def destroy
    @favorie_produit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorie_produit
      @favorie_produit = FavorieProduit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def favorie_produit_params
      params.require(:favorie_produit).permit(:produit_id, :user_id)
    end
end
