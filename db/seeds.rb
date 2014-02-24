Card.create(term: 'Topher', description: "Magic Man", deck_id: 1)
Card.create(term: 'Sherif', description: "There is no list", deck_id: 1)
Card.create(term: 'Steven', description: "Heroku Master", deck_id: 1)

Deck.create(name: "MVP Deck")

10.times do
 Card.create(term: Faker::Lorem.word, description: Faker::Lorem.sentence, deck_id: 1)
end


Card.create(term: 'Zoidberg', description: "Why not", deck_id: 2)
Card.create(term: 'Glen', description: "Hates me", deck_id: 2)



Deck.create(name: "2")


Card.create(term:"Anchorman", description: "I'm in a glass case of emotion", deck_id: 3)
Card.create(term:"Gone With the Wind", description: "Frankly, my dear, I don't give a damn.", deck_id: 3)
Card.create(term:"Casablanca", description: "Here's looking at you, kid", deck_id: 3)
Card.create(term:"The Wizard of Oz", description: "There's no place like home", deck_id: 3)
Card.create(term:"Citizen Kane", description: "Rosebud", deck_id: 3)
Card.create(term:"Dirty Dancing", description: "Nobody puts Baby in the corner", deck_id: 3)
Card.create(term:"The Big Lebowski", description: "That rug really tied the room together", deck_id: 3)
Card.create(term:"Billy Madison", description: "If peeing your pants is cool, consider me Miles Davis", deck_id: 3)
Card.create(term:"Meet the Parents", description: "I have nipples, Greg. Could you milk me?", deck_id: 3)
Card.create(term:"Tommy Boy", description: "Fat guy in a little coat", deck_id: 3)

Deck.create(name: "Movie quotes")