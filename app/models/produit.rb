class Produit < ApplicationRecord
  belongs_to :sub_categorie_produit
  belongs_to :user
end
