class ReservationSerializer < ActiveModel::Serializer
  attributes :id, :date_reservation, :statut
  has_one :produit
  has_one :user
end
