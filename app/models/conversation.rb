class Conversation < ApplicationRecord
    has_many :calls
    has_many :messages
    belongs_to :user1_id, class_name: "user", foreign_key: "user1_id"
    belongs_to :user2_id, class_name: "user", foreign_key: "user2_id"
end
