class MenuSerializer < ActiveModel::Serializer
  attributes :id, :nom_plat, :description, :prix, :categorie_plat, :ingredient
  has_one :restauration
end
