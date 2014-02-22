Deck.create(name: "MVP Deck")

10.times do
 Card.create(term: Faker::Lorem.word, description: Faker::Lorem.sentence, deck_id: 1)
end



