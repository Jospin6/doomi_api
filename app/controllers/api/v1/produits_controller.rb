class Api::V1::ProduitsController < ApplicationController
  before_action :set_produit, only: %i[ show update destroy add_recommandation ]

  # GET /produits
  def index
    @produits = Produit.includes(:vetement_chaussure, 
    :vehicule, 
    :immobilier, 
    :evenement, 
    :emploi, 
    :autre_produit_attribut).all

    render json: @produits
  end

  # GET /produits/1
  def show
    render json: @produit
  end

  def search_products
    search_term = params[:title]

    @produits = Produit.includes(:vetement_chaussure, 
                                  :vehicule, 
                                  :immobilier, 
                                  :evenement, 
                                  :emploi, 
                                  :autre_produit_attribut)
                       .where("titre ILIKE ?", "%#{search_term}%")
  
    render json: @produits 
  end
  

  def user_produits

    @produits = CategorieProduit.includes(
    sub_categorie_produits: {
        produits: [:vetement_chaussure, 
                   :vehicule, 
                   :immobilier, 
                   :evenement, 
                   :emploi, 
                   :autre_produit_attribut]
    }
    ).where(sub_categorie_produits: { produits: { user_id: current_user.id } })

    render json: @produits
  end
  

  # POST /produits
  def create
    @produit = Produit.new(produit_params)
    if params.key?(:vehicule)
      @produit.build_vehicule(vehicule_params)
    elsif params.key?(:immobilier)
      @produit.build_immobilier(immobilier_params)
    elsif params.key?(:evenement)
      @produit.build_evenement(evenement_params)
    elsif params.key?(:emploi)
      @produit.build_emploi(emploi_params)
    elsif params.key?(:vetement_chaussure)
      @produit.build_vetement_chaussure(vetement_chaussure_params)
    elsif params.key?(:autre_produit_attribut)
      @produit.build_autre_produit_attribut(autre_produit_attribut_params)
    elsif params.key?(:service)
      @produit.build_service(service_params)
    else
      return
    end
    
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
        :vetement_chaussure, 
        :vehicule, 
        :immobilier, 
        :evenement, 
        :emploi, 
        :autre_produit_attribut,
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
        vetement_chaussure_attributes: [:type, :taille, :matiere],
        autre_produit_attribut_attributes: [:etat, :marque],
        service_attributes: [:statut],
        images_attributes: [:image]
        )
    end

    def vehicule_params
      vehicule_data = JSON.parse(params[:vehicule])
      permitted_params = ActionController::Parameters.new(vehicule_data)
      permitted_params.permit(:modele, :annee, :kilometrage, :produit_id, :type_vehicule, :couleur, :carburant, :transmission, :nombre_portes, :nombre_places, :statut, :plan_de_paiement, :disponibilite)
    end

    def immobilier_params
      immobilier_data = JSON.parse(params[:immobilier])
      permitted_params = ActionController::Parameters.new(immobilier_data)
      permitted_params.permit(:type_de_bien, :adresse, :produit_id, :surface_habitable, :nombre_chambres, :nombre_pieces)
    end

    def evenement_params
      evenement_data = JSON.parse(params[:evenement])
      permitted_params = ActionController::Parameters.new(evenement_data)
      permitted_params.permit(:date_evenement, :lieu, :type_prix, :site_web, :etat_evenement)
    end

    def emploi_params
      emploi_data = JSON.parse(params[:emploi])
      permitted_params = ActionController::Parameters.new(emploi_data)
      permitted_params.permit(:type_contrat, :lieu, :secteur_activite, :niveau_experience, :date_limite, :site_web, :formation_requise, :etat_offre)
    end

    def vetement_chaussure_params
      vetement_chaussure_data = JSON.parse(params[:vetement_chaussure])
      permitted_params = ActionController::Parameters.new(vetement_chaussure_data)
      permitted_params.permit(:type, :taille, :matiere)
    end

    def autre_produit_attribut_params
      autre_produit_attribut_data = JSON.parse(params[:autre_produit_attribut])
      permitted_params = ActionController::Parameters.new(autre_produit_attribut_data)
      permitted_params.permit(:etat, :marque)
    end
    
    def service_params
      service_data = JSON.parse(params[:service])
      permitted_params = ActionController::Parameters.new(service_data)
      permitted_params.permit(:statut)
    end

    def attach_images
      params[:images].each do |image|
        @produit.images.create(image: image) if image.present?
      end
    end
end
