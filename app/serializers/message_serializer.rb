class MessageSerializer < ActiveModel::Serializer
  attributes :id, :sender, :body, :audio_file, :is_read
  has_one :conversation
end
