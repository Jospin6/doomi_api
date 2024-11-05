class Produit < ApplicationRecord
  belongs_to :sub_categorie_produit
  belongs_to :user
  has_many :transactions
  has_many :acheteurs, through: :transactions

end
