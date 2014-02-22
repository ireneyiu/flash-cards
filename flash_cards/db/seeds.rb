Card.create(term: 'Topher', description: "Magic Man", deck_id: 1)
Card.create(term: 'Sherif', description: "There is no list", deck_id: 1)
Card.create(term: 'Steven', description: "Heroku Master", deck_id: 1)

Deck.create(name: "MVP Deck")

10.times do
 Card.create(term: Faker::Lorem.word, description: Faker::Lorem.sentence, deck_id: 1)
end





