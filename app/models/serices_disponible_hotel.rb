class SericesDisponibleHotel < ApplicationRecord
  belongs_to :hotellerie_service
  has_many :images, as: :imageable
end
