class Transaction < ApplicationRecord
  belongs_to :produit
  belongs_to :acheteur, class_name: "User"
  has_one :paiement, as: :paiementable
end
