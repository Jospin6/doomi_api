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
  # has_many_attached :images
  has_many :images, as: :imageable, dependent: :destroy

  has_one :vetement_chaussure
  has_one :vehicule
  has_one :immobilier
  has_one :evenement
  has_one :emploi
  has_one :autre_produit_attribut
  has_one :service

  accepts_nested_attributes_for :immobilier, 
    :images, 
    :vetement_chaussure, 
    :vehicule, 
    :evenement, 
    :emploi, 
    :autre_produit_attribut, 
    :service
  
  
  
end
