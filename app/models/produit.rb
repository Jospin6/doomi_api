class Produit < ApplicationRecord
  belongs_to :sub_categorie_produit
  belongs_to :user
  has_many :transactions
  has_many :acheteurs, through: :transactions

  has_one :vetementChaussure
  has_one :vehicule
  has_one :immobilier
  has_one :evenement
  has_one :emploi
  has_one :autreProduitAttribut

end
