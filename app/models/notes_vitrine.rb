class NotesVitrine < ApplicationRecord
  belongs_to :vitrine
  belongs_to :client, class_name: "User"
end
