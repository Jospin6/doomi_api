class Api::V1::TransactionsController < ApplicationController
  before_action :set_transaction, only: %i[ show update destroy ]

  # GET /transactions
  def index
    @transactions = Transaction.all

    render json: @transactions
  end

  # GET /transactions/1
  def show
    render json: @transaction
  end

  def user_transactions
    @get_user_ventes = Produit.includes(:transactions, :acheteurs).where("user_id = ", current_user.id)
    @get_user_achats = Transaction.includes(produit: :user).where("acheteur = ", current_user.id)
    if @get_user_ventes && @get_user_achats
      render json: {
        data: {
          "ventes": @get_user_ventes,
          "achats": @get_user_achats
        }
      }, status: :ok
    else
      render json: {
        message: 'Y a une erreur dans la requete',
      },status: :unprocessable_entity 
    end
    
    
  end
  

  # POST /transactions
  def create
    @transaction = Transaction.new(transaction_params)

    if @transaction.save
      render json: @transaction, status: :created
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /transactions/1
  def update
    if @transaction.update(transaction_params)
      render json: @transaction
    else
      render json: @transaction.errors, status: :unprocessable_entity
    end
  end

  # DELETE /transactions/1
  def destroy
    @transaction.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transaction_params
      params.require(:transaction).permit(:produit_id, :acheteur, :notes, :status)
    end
end
