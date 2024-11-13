class Follower < ApplicationRecord
  belongs_to :vitrine
  belongs_to :follower, class_name: "User", foreign_key: "user_id"
end
