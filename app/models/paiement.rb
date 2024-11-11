class Paiement < ApplicationRecord
  belongs_to :paiementable, polymorphic: true
end
