get '/decks' do
  @decks = Deck.all
  clear_last_term
  erb :"decks/show"
end

get '/decks/new' do
  #if user is logged in
  clear_last_term
  erb :"decks/new"
end

post '/decks' do
  Deck.create(name: params[:name], user_id: current_user.id)
  redirect "/decks"
end

get '/decks/:deck_id/cards/new' do

=begin review
  Deck.find() does the same by default
=end

  @deck = Deck.find_by_id(params[:deck_id])

=begin review

The fact that this keeps popping up should trigger something for
you...like...maybe there's another way..

=end
  @last_card_term = session[:last_card_term] || nil

=begin review

Since you love helper methods so much why not "owns_deck?"

=end

  redirect '/decks' unless current_user && (current_user.id == @deck.user_id)
  erb :"cards/new"
end

post '/decks/:deck_id/cards' do
=begin review

Personally i love this style.  People i've worked with hated it.  Don't get married it :)

=end

  card = Card.create(
    term:         params[:term],
    description:  params[:description],
    deck_id:      params[:deck_id]
  )


=begin review
  session[:last_card_term] = card.valid? ? params[:term] : nil
=end

  if card.valid?
    session[:last_card_term] = params[:term]
  else
    session[:last_card_term] = nil
  end
  redirect "/decks/#{params[:deck_id]}/cards/new"
end
