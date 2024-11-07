class RestaurationSerializer < ActiveModel::Serializer
  attributes :id, :nom, :type_cuisine, :adresse, :contacts, :site_web, :capacite, :horaires, :type_services, :localisation
  has_one :user
end
