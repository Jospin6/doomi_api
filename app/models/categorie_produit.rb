class CategorieProduit < ApplicationRecord
    has_many :sub_categorie_produits
end
