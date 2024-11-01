FactoryBot.define do
  factory :immobilier do
    produit { nil }
    type_de_bien { 1 }
    adresse { "MyString" }
    surface_habitable { "MyString" }
    nombre_chambres { 1 }
    nombre_pieces { 1 }
  end
end
