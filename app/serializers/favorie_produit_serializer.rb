class FavorieProduitSerializer < ActiveModel::Serializer
  attributes :id
  has_one :produit
  has_one :user
end
