class SubCategorieProduitSerializer < ActiveModel::Serializer
  attributes :id, :titre
  has_one :categorie_produit
end
