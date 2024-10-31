class PaiementSerializer < ActiveModel::Serializer
  attributes :id, :mode, :montant
  has_one :transaction
end
