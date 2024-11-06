FactoryBot.define do
  factory :recherche_produit do
    libele { "MyString" }
    user { nil }
    date_heure { "2024-11-06 10:24:42" }
    resultats { 1 }
    localisation { "MyString" }
  end
end
