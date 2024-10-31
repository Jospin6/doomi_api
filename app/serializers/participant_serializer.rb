class ParticipantSerializer < ActiveModel::Serializer
  attributes :id
  has_one :conversation
  has_one :user
end
