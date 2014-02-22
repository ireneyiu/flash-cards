Card.create(term: 'Topher', description: "Magic Man", deck_id: 1)
Card.create(term: 'Sherif', description: "There is no list", deck_id: 1)
Card.create(term: 'Steven', description: "Heroku Master", deck_id: 1)

Deck.create(name: "MVP Deck")

10.times do
 Card.create(term: Faker::Lorem.word, description: Faker::Lorem.sentence, deck_id: 1)
end


Card.create(term: 'Zoidberg', description: "Why not", deck_id: 2)
Card.create(term: 'Glen', description: "Hates me", deck_id: 2)


<<<<<<< HEAD

=======
Deck.create(name: "2")
>>>>>>> add core feature rounds, add/change corresponding views, add second small deck to db seed, add migration to track the number of right and wrong questions
