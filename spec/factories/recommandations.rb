FactoryBot.define do
  factory :recommandation do
    recommandable_type { "MyString" }
    recommandable_id { 1 }
    contenu { "MyText" }
  end
end
