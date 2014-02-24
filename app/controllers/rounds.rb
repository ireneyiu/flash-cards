=begin review

OK this find_by_id thing has got to go :)

=end


#please link your decks here to start a new round
get "/rounds/new/:deck_id" do
  deck = Deck.find_by_id(params[:deck_id])
  if !!deck
    clear_last_term

=begin review

I feel like here is where a Round cound have taken the responsibility for
managing remaining cards for you.  It's so much better to have that logic
encapsulated in a class than have it lurking in a primitive object like the
session (i.e. something that is essentially a Hash).

There's a well known refactoring called: Replace Hash with Object which applies
here.

=end
    session[ :remaining_cards ] = deck.cards.shuffle.map{|card| card.id }
    round = Round.create(user_id: current_user.id, deck_id: deck.id)
    redirect "/rounds/#{round.id}"
  else
    redirect "/"
  end
end


get "/rounds/:id/end" do
  @correct = session[:last_correct]
  @card = Card.find_by_id( session[ :last_card ])
  @round = Round.find_by_id( params[:id] )
  erb :"rounds/show_round_end"
end

post "/rounds/:id" do

=begin review

if you like spaces around parentheses, consider joining jQuery project.  That's part of their style guide!

=end
  @round = Round.find_by_id( params[:id] )

=begin review
  See this #first call...to me it totally suggests that Replace Hash with Object is a huge win for you.
=end

  @card = Card.find_by_id( session[ :remaining_cards ].first )


=begin review

Does a controller need to be handling this. Why not ask the card?

@card.correct?(params[:term])

This is the way of OO-Nirvana.

Come to think of that, if you move that responsibility to a Card, then you can get rid of this `guess_helper` thing.

=end

  @guess = params[:term].downcase == @card.term.downcase
  guess_helper(!!@guess)

  redirect "/rounds/#{params[:id]}/end" if session[ :remaining_cards ] == []
  redirect "/rounds/#{params[:id]}/answer"
end

get "/rounds/:id/answer" do
  @correct = session[:last_correct]
  @card = Card.find_by_id( session[ :last_card ])
  @round = Round.find_by_id( params[:id] )
  erb :"rounds/show_last"
end


get "/rounds/:id" do
  current_card_id = session[ :remaining_cards ].first
  if current_card_id
    @card = Card.find_by_id( current_card_id )
    @round = Round.find_by_id( params[:id] )
    erb :"rounds/show"
  else
    redirect '/'
  end
end
