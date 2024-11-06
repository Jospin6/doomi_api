FactoryBot.define do
  factory :image do
    imageable_type { "MyString" }
    imageable_id { 1 }
    image { "MyString" }
  end
end
