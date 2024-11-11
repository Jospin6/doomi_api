class Service < ApplicationRecord
  belongs_to :produit
  has_many :evaluations, as: :evaluationable
end
