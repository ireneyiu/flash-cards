FactoryGirl.define do
  factory :user do
    name "Test User"
    user_password "test"
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

FactoryGirl.define do
  sequence :name do |n|
    "name#{n}"
  end
end