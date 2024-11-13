class Call < ApplicationRecord
    belongs_to :caller, class_name: "User", foreign_key: "user1_id"
    belongs_to :receiver, class_name: "User", foreign_key: "user2_id"
    belongs_to :conversation, optional: true
end
