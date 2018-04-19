FactoryBot.define do
  factory :report do
    reporter "test@test.com"
    address  "123 Test Street"
    rating 1
    description "It sucks."
  end
end
