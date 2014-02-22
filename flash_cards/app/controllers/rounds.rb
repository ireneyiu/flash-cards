# # get "/rounds/:id/guesses/:id" do

# #   @deck = Deck.first
# #   @card =
# #   erb :"rounds/show"
# # end


#     # create_table :guesses do |t|
#     #   t.belongs_to :round
#     #   t.belongs_to :card
#     #   t.boolean    :correct
#     #   t.timestamps
#     # end

# get "/rounds/:id" do
#   round = Round.create()
#   @deck = Deck.first
#   @deck.cards.each_with_index do |card, index|
#     round.guesses.create(deck: @deck.id, card: card.id)
#   end
#   erb :"rounds/show"
# end

# post ""

# get "/rounds/:round_id/guesses/:guess_id" do




#   #check if the guess has a value yet?
#   #if it doesn't have a value,
#     #change the guess.correct is null,
#   #   #
#   # guess = Guess.find_by_id(params[:guess_id])
#   # if guess
#   #   @card = guess.card
#   # else
#   #   "Quiz done"
#   # end

#   @card = Card.find_by_id(params[:guess_id])

#   @deck = Deck.first
#   @card =
#   erb :"rounds/show"
# end


# /someroute/1
# card 1
# post 1
# card 1 @guess_correct = false/true
# card 2

# card 11