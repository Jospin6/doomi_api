FactoryBot.define do
  factory :hotellerie_service do
    nom_hotel { "MyString" }
    type_hebergement { "MyString" }
    adresse { "MyText" }
    contacts { "MyText" }
    email { "MyText" }
    site_web { "MyText" }
    nombre_chambres { 1 }
    capacite_accueil { 1 }
    tarif_moyen { "9.99" }
    horaires { "MyText" }
    localisation { "MyString" }
    user { nil }
  end
end
