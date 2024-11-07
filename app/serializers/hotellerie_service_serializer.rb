class HotellerieServiceSerializer < ActiveModel::Serializer
  attributes :id, :nom_hotel, :type_hebergement, :adresse, :contacts, :email, :site_web, :nombre_chambres, :capacite_accueil, :tarif_moyen, :horaires, :localisation
  has_one :user
end
