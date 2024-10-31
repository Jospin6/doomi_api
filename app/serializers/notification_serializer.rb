class NotificationSerializer < ActiveModel::Serializer
  attributes :id, :type, :message, :is_read
  has_one :user
  has_one :produit
end
