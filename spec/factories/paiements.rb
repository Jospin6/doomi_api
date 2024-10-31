FactoryBot.define do
  factory :paiement do
    transaction { nil }
    mode { "MyString" }
    montant { "9.99" }
  end
end
