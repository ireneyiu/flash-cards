# get '/' do
#   # Look in app/views/index.erb
#   past_id = Round.last.id || 0
#   Round.create()
#   redirect "/rounds/#{past_id + 1}"
# end

get '/' do
  redirect "/cards/1"
end

get '/cards/:id' do
  @card = Card.find_by_id(params[:id])
  erb :card
end

post '/cards/:id' do
  @card = Card.find_by_id(params[:id])
  @guess = (@card.term == params[:term])
  erb :card
end

# Controller sends the card into page.
# If guess.empty?
  # Show front of card
  # Submit post with guess
  # Redirect back
# otherwise
  # show back of card
  # show next link
# end