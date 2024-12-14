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

    params[:produit][:images].each do |image|
      @produit.images.create(image: image)
    end
    
    if params[:vehicule]
      @produit.build_vehicule(vehicule_params)
    elsif params[:immobilier]
      @produit.build_immobilier(immobilier_params)
    elsif params[:evenement]
      @produit.build_evenement(evenement_params)
    elsif params[:emploi]
      @produit.build_emploi(emploi_params) 
    elsif params[:service]
      @produit.build_service(service_params)    
    else
      @produit.build_autreProduitAttribut(autreProduit_attribut_params)
    end

    if @produit.save
      render json: @produit, status: :created
    else
      render json: @produit.errors, status: :unprocessable_entity
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
      params.require(:produit).permit(:titre, :prix, :description, :devise, :is_visible, :localisation, :sub_categorie_produit_id, :user_id)
    end

    def vehicule_params
      params.require(:vehicule).permit(:modele, :annee, :kilometrage, :type_vehicule, :couleur, :carburant, :transmission, :nombre_portes, :nombre_places, :statut, :plan_de_paiement, :disponibilite)
    end

    def immobilier_params
      params.require(:immobilier).permit(:type_de_bien, :adresse, :surface_habitable, :nombre_chambres, :nombre_pieces)
    end

    def evenement_params
      params.require(:evenement).permit(:date_evenement, :lieu, :type_prix, :site_web, :etat_evenement)
    end

    def emploi_params
      params.require(:emploi).permit(:type_contrat, :lieu, :secteur_activite, :niveau_experience, :date_limite, :site_web, :formation_requise, :etat_offre)
    end

    def autreProduit_attribut_params
      params.require(:autre_produit_attribut).permit(:etat, :marque)
    end

    def vetement_chaussure_params
      params.require(:vetement_chaussure).permit(:type, :taille, :matiere)
    end

    def service_params
      params.require(:service).permit(:statut)
    end
end
