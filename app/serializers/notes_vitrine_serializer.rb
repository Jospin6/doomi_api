class NotesVitrineSerializer < ActiveModel::Serializer
  attributes :id, :client, :note
  has_one :vitrine
end
