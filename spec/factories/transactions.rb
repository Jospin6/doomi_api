FactoryBot.define do
  factory :transaction do
    produit { nil }
    acheteur { 1 }
    status { "MyString" }
  end
end
