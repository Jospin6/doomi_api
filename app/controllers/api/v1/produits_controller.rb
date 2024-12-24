class Api::V1::ProduitsController < ApplicationController
  before_action :set_produit, only: %i[ show update destroy add_recommandation ]

  # GET /produits
  def index
    @produits = Produit.includes(:vetementChaussure, 
    :vehicule, 
    :immobilier, 
    :evenement, 
    :emploi, 
    :autreProduitAttribut).all

    render json: @produits
  end

  # GET /produits/1
  def show
    render json: @produit
  end

  def search_products
    search_term = params[:title]

    @produits = Produit.includes(:vetementChaussure, 
                                  :vehicule, 
                                  :immobilier, 
                                  :evenement, 
                                  :emploi, 
                                  :autreProduitAttribut)
                       .where("titre ILIKE ?", "%#{search_term}%")
  
    render json: @produits 
  end
  

  def user_produits

    @produits = CategorieProduit.includes(
    sub_categorie_produits: {
        produits: [:vetementChaussure, 
                   :vehicule, 
                   :immobilier, 
                   :evenement, 
                   :emploi, 
                   :autreProduitAttribut]
    }
    ).where(sub_categorie_produits: { produits: { user_id: current_user.id } })

    render json: @produits
  end
  

  # POST /produits
  def create
    @produit = Produit.new(produit_params)
    
    if @produit.save
      attach_images if params[:images].present?
      render json: { message: 'Produit créé avec succès', produit: @produit }, status: :created
    else
      render json: { errors: @produit.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def add_recommandation
    @produit.recommandations.create(contenu: params[:term], user_id: current_user.id)
    render json: {
      message: "recommandation added successfully"
    }, status: :ok
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
      @produit = Produit.includes(
        :vetementChaussure, 
        :vehicule, 
        :immobilier, 
        :evenement, 
        :emploi, 
        :autreProduitAttribut,
        sub_categorie_produits: :categorie_produit
      ).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def produit_params
      produit_data = JSON.parse(params[:produit])
      permitted_params = ActionController::Parameters.new(produit_data)
      permitted_params.permit(
        :user_id, 
        :titre, 
        :prix, 
        :devise, 
        :description, 
        :localisation, 
        :sub_categorie_produit_id,
        vehicule_attributes: [:modele, :annee, :kilometrage, :produit_id, :type_vehicule, :couleur, :carburant, :transmission, :nombre_portes, :nombre_places, :statut, :plan_de_paiement, :disponibilite],
        immobilier_attributes: [:type_de_bien, :adresse, :produit_id, :surface_habitable, :nombre_chambres, :nombre_pieces],
        evenement_attributes: [:date_evenement, :lieu, :type_prix, :site_web, :etat_evenement],
        emploi_attributes: [:type_contrat, :lieu, :secteur_activite, :niveau_experience, :date_limite, :site_web, :formation_requise, :etat_offre],
        autre_produit_attribut_attributes: [:etat, :marque],
        vetement_chaussure_attributes: [:type, :taille, :matiere],
        service_attributes: [:statut]
        )
    end

    def attach_images
      params[:images].each do |image|
        @produit.images.create(image: image) if image.present?
      end
    end
end
