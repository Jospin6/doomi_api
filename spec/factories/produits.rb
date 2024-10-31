FactoryBot.define do
  factory :produit do
    titre { "MyString" }
    prix { "9.99" }
    description { "MyText" }
    sub_categorie_produit { nil }
  end
end
