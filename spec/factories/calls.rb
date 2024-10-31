FactoryBot.define do
  factory :call do
    caller { 1 }
    receiver { 1 }
    call_type { "MyString" }
    start_time { "2024-10-31 10:38:27" }
    end_time { "2024-10-31 10:38:27" }
    status { "MyString" }
  end
end
