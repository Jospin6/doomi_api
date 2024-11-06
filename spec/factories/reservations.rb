FactoryBot.define do
  factory :reservation do
    produit { nil }
    user { nil }
    date_reservation { "2024-11-06 11:21:40" }
    statut { "MyString" }
  end
end
