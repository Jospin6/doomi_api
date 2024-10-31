class VitrineSerializer < ActiveModel::Serializer
  attributes :id, :titre, :description, :profil_img, :cover_img, :specialites, :horaires
end
