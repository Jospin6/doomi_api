class FavorieProduit < ApplicationRecord
  belongs_to :produit
  belongs_to :user
end
