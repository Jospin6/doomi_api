class Transaction < ApplicationRecord
  belongs_to :produit
  belongs_to :acheteur, class_name: "User", foreign_key: "user_id"
  has_one :paiement, as: :paiementable
end
