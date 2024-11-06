class NotesVitrine < ApplicationRecord
  belongs_to :vitrine
  belongs_to :client, class_name: "User"

  validates :note, presence: true, inclusion: { in: 0..5 }
end
