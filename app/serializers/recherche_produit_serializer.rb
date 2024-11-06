class RechercheProduitSerializer < ActiveModel::Serializer
  attributes :id, :libele, :date_heure, :resultats, :localisation
  has_one :user
end
