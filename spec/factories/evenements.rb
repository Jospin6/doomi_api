FactoryBot.define do
  factory :evenement do
    produit { nil }
    date_evenement { "2024-11-01" }
    lieu { "MyString" }
    type_prix { 1 }
    site_web { "MyText" }
    etat_evenement { 1 }
  end
end
