FactoryBot.define do
  factory :report do
    reporter "test@test.com"
    address  "123 Test Street"
    rating 1
    description "It sucks."
  end

  factory :great_report, class: Report do
    reporter "test2@test.com"
    address "345 Tester Lane"
    rating 5
    description "Literally golden."
  end

  factory :avg_report, class: Report do
    reporter "test3@test.com"
    address "678 Testing Drive"
    rating 3
    description "Could be better."
  end
end
