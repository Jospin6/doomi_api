class Projet < ApplicationRecord
  belongs_to :service
  has_many :images, as: :imageable
end
