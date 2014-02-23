#please link your decks here to start a new round
get "/rounds/new/:deck_id" do
  deck = Deck.find_by_id(params[:deck_id])
  if !!deck
    clear_last_term
    session[ :remaining_cards ] = deck.cards.shuffle.map{|card| card.id }
    round = Round.create(user_id: current_user.id, deck_id: deck.id)
    redirect "/rounds/#{deck.id}"
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
  @round = Round.find_by_id( params[:id] )
  @card = Card.find_by_id( session[ :remaining_cards ].first )
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
  @card = Card.find_by_id( current_card_id )
  @round = Round.find_by_id( params[:id] )
  erb :"rounds/show"
end
