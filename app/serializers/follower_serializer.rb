class FollowerSerializer < ActiveModel::Serializer
  attributes :id, :follower
  has_one :vitrine
end
