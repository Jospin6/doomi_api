class ServicesDisponibleHotelSerializer < ActiveModel::Serializer
  attributes :id, :nom_service, :description, :statut, :cout
  has_one :hotellerie_service
end
