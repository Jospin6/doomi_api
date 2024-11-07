class Restauration < ApplicationRecord
  belongs_to :user
  has_many :recommandations, as: :recommandable
  has_many :images, as: :imageable
  has_many :evaluations, as: :evaluationable
  has_many :reservations, as: :reservationable
  has_many :boosts, as: :boostable
  has_many :a_la_unes, as: :a_la_uneable
end
