class Reservation < ApplicationRecord
  belongs_to :reservationable, polymorphic: true
  belongs_to :user
end
