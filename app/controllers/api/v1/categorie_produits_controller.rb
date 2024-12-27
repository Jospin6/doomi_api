class Api::V1::CategorieProduitsController < ApplicationController
  before_action :set_categorie_produit, only: %i[ show update destroy ]

  # GET /categorie_produits
  def index
    @categorie_produits = CategorieProduit.includes(sub_categorie_produits: {
      produits: {
        vetement_chaussure: {}, 
        vehicule: {}, 
        immobilier: {}, 
        evenement: {}, 
        emploi: {}, 
        autre_produit_attribut: {},
        service: {},
        images: [],
        user: {}
      }
  }).all

    render json: @categorie_produits.as_json(include: {
      sub_categorie_produits: {
        include: {
          produits: {
            images: {
              only: [
                :id, 
                :imageable_type, 
                :imageable_id]
            },
            vetement_chaussure: {
              only: [
                :type_vetement, 
                :taille, 
                :matiere]
            },
            vehicule: {
              only: [
                :modele, 
                :annee, 
                :kilometrage, 
                :type_vehicule, 
                :couleur, 
                :carburant, 
                :transmission, 
                :nombre_portes, 
                :nombre_places, 
                :statut, 
                :plan_de_paiement, 
                :disponibilite]
            },
            immobilier: {
              only: [
                :type_de_bien, 
                :adresse, 
                :surface_habitable, 
                :nombre_chambres, 
                :nombre_pieces]
            },
            evenement: {
              only: [
                :date_evenement, 
                :lieu, 
                :type_prix, 
                :site_web, 
                :etat_evenement]
            },
            emploi: {
              only: [
                :type_contrat, 
                :lieu, 
                :secteur_activite, 
                :niveau_experience, 
                :date_limite, 
                :site_web, 
                :formation_requise, 
                :etat_offre]
            },
            autre_produit_attribut: {
              only: [
                :etat, 
                :marque]
            },
            service: {
              only: [:statut]
            },
            user: {
              only: [:id, :username]
            },
            method: [:image_urls]
          }
        }
      }
    })
  end

  # GET /categorie_produits/1
  def show
    render json: @categorie_produit.as_json(include: {
      sub_categorie_produits: {
        include: {
          produits: {
            images: {
              only: [
                :id, 
                :imageable_type, 
                :imageable_id]
            },
            vetement_chaussure: {
              only: [
                :type_vetement, 
                :taille, 
                :matiere]
            },
            vehicule: {
              only: [
                :modele, 
                :annee, 
                :kilometrage, 
                :type_vehicule, 
                :couleur, 
                :carburant, 
                :transmission, 
                :nombre_portes, 
                :nombre_places, 
                :statut, 
                :plan_de_paiement, 
                :disponibilite]
            },
            immobilier: {
              only: [
                :type_de_bien, 
                :adresse, 
                :surface_habitable, 
                :nombre_chambres, 
                :nombre_pieces]
            },
            evenement: {
              only: [
                :date_evenement, 
                :lieu, 
                :type_prix, 
                :site_web, 
                :etat_evenement]
            },
            emploi: {
              only: [
                :type_contrat, 
                :lieu, 
                :secteur_activite, 
                :niveau_experience, 
                :date_limite, 
                :site_web, 
                :formation_requise, 
                :etat_offre]
            },
            autre_produit_attribut: {
              only: [
                :etat, 
                :marque]
            },
            service: {
              only: [:statut]
            },
            user: {
              only: [:id, :username]
            },
            method: [:image_urls]
          }
        }
      }
    })
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
        produits: {
          vetement_chaussure: {}, 
          vehicule: {}, 
          immobilier: {}, 
          evenement: {}, 
          emploi: {}, 
          autre_produit_attribut: {},
          service: {},
          images: [],
          user: {}
        }
    }).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorie_produit_params
      params.require(:categorie_produit).permit(:titre, :description, :image)
    end
end
