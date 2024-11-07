class Menu < ApplicationRecord
  belongs_to :restauration
  has_many :images, as: :imageable
end
