class Vitrine < ApplicationRecord
    belongs_to :user
    has_many :follewers
end
