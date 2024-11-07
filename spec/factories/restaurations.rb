FactoryBot.define do
  factory :restauration do
    nom { "MyString" }
    type_cuisine { 1 }
    adresse { "MyText" }
    contacts { "MyText" }
    site_web { "MyText" }
    capacite { 1 }
    horaires { "MyText" }
    type_services { 1 }
    localisation { "MyString" }
    user { nil }
  end
end
