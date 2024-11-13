class Conversation < ApplicationRecord
    has_many :calls
    has_many :messages
    belongs_to :user1, class_name: "User", foreign_key: "user1_id"
    belongs_to :user2, class_name: "User", foreign_key: "user2_id"
end
