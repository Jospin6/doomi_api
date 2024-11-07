FactoryBot.define do
  factory :menu do
    restauration { nil }
    nom_plat { "MyString" }
    description { "MyText" }
    prix { "9.99" }
    categorie_plat { 1 }
    ingredient { "MyText" }
  end
end
