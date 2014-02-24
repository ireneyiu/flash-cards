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
  @deck = Deck.find_by_id(params[:deck_id])
  @last_card_term = session[:last_card_term] || nil
  redirect '/decks' unless current_user && (current_user.id == @deck.user_id)
  erb :"cards/new"
end

post '/decks/:deck_id/cards' do
  card = Card.create(
    term:         params[:term],
    description:  params[:description],
    deck_id:      params[:deck_id]
  )
  if card.valid?
    session[:last_card_term] = params[:term]
  else
    session[:last_card_term] = nil
  end
  redirect "/decks/#{params[:deck_id]}/cards/new"
end