FactoryBot.define do
  factory :serices_disponible_hotel do
    hotellerie_service { nil }
    nom_service { "MyString" }
    description { "MyText" }
    statut { 1 }
    cout { "9.99" }
  end
end
