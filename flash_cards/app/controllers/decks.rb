get '/decks' do
  @decks = Deck.all
  erb :"decks/show"
end

get '/decks/new' do
  #if user is logged in
  erb :"decks/new"
end

post '/decks' do
  Deck.create(name: params[:name])
  redirect "/decks"
end

get '/decks/:deck_id/cards/new' do
  @deck = Deck.find_by_id(params[:deck_id])
  erb :"cards/new"
end

post '/decks/:deck_id/cards' do
  card = Card.create(
    term:         params[:term],
    description:  params[:description],
    deck_id:      params[:deck_id]
  )
  redirect "/decks/#{params[:deck_id]}/cards/new"
end