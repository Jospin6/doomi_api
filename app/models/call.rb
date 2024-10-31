class Call < ApplicationRecord
    belongs_to :caller, class_name: "User"
    belongs_to :receiver, class_name: "User"
    belongs_to :conversation, optional: true
end
