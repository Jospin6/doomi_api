class Boost < ApplicationRecord
  belongs_to :boostable, polymorphic: true
  belongs_to :user
end
