FactoryBot.define do
  factory :message do
    conversation { nil }
    sender { 1 }
    body { "MyText" }
    audio_file { "MyString" }
    is_read { false }
  end
end
