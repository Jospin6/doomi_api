FactoryBot.define do
  factory :evaluation do
    evaluationable_type { "MyString" }
    evaluationable_id { 1 }
    evaluation { 1 }
  end
end
