FactoryBot.define do
  factory :notification do
    user { nil }
    type { "" }
    message { "MyText" }
    is_read { false }
    produit { nil }
  end
end
