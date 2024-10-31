class TransactionSerializer < ActiveModel::Serializer
  attributes :id, :acheteur, :status
  has_one :produit
end
