FactoryBot.define do
  factory :compte_info do
    user { nil }
    type_compte { 1 }
    confirmation_code { "MyString" }
    confirmed_at { "2024-11-01 11:11:46" }
  end
end
