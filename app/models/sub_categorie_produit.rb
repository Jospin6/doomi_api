class SubCategorieProduit < ApplicationRecord
  belongs_to :categorie_produit
  has_many :produits
end
