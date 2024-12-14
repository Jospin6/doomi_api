class Produit < ApplicationRecord
  belongs_to :sub_categorie_produit
  belongs_to :user
  has_many :transactions
  has_many :acheteurs, through: :transactions
  has_many :recommandations, as: :recommandable
  has_many :reservations, as: :reservationable
  has_many :boosts, as: :boostable
  has_many :a_la_unes, as: :a_la_uneable
  has_many :notifications, as: :notificationable

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
  
  has_one :vetementChaussure
  has_one :vehicule
  has_one :immobilier
  has_one :evenement
  has_one :emploi
  has_one :autreProduitAttribut
  has_one :service
  
end
