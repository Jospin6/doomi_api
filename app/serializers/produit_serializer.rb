class ProduitSerializer < ActiveModel::Serializer
  attributes :id, :titre, :prix, :description
  has_one :sub_categorie_produit
end
