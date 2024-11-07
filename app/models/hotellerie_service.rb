class HotellerieService < ApplicationRecord
  belongs_to :user
  has_many :recommandations, as: :recommandable
  has_many :images, as: :imageable
  has_many :evaluations, as: :evaluationable
  has_many :reservations, as: :reservationable

end
