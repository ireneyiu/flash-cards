=begin review

You're lying to me!  You said that you were creating a fixture for a user.rb,
but lo and behold you're creating Factories for a number of models.  Break this
down into a number of smaller files.  Files are friends, not enemies.

BUT:  Super cool that you're using FactoryGirl <3
=end

FactoryGirl.define do
  factory :user do
    name "Test User"
    user_password  "1234"
    email "test5@example.com"
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
