FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "person#{n}" }
    user_password  "1234"
    sequence(:email) {|n| "name#{n}@example.com" }
  end

  factory :deck do
    name "new deck"
    user
  end

  factory :card do
    term  "card"
    description "answer"
    deck
  end
end