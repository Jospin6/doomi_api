class Transaction < ApplicationRecord
  belongs_to :produit
  belongs_to :acheteur, class_name: "User"
end
