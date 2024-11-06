FactoryBot.define do
  factory :service do
    produit { nil }
    statut { "MyString" }
    evaluation_moyenne { "9.99" }
    nombre_evaluation { 1 }
  end
end
