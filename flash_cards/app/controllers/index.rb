# get '/' do
#   # Look in app/views/index.erb
#   past_id = Round.last.id || 0
#   Round.create()
#   redirect "/rounds/#{past_id + 1}"
# end

def login?
  !!session[:id]
end

get '/' do
  @alert = params[:alert] if params[:alert]
  erb :index
end


post '/' do
  user = params[:name]
  password = params[:user_password]
  member = User.find_by_name(user)
  if member == nil || false
    redirect "/?alert=You entered an incorrect username"
  elsif member.user_password == nil || false
    redirect "/?alert=Your password is invalid"
  elsif member.user_password == password
    user_session = User.find_by_name(user).id
    session[:id] =  user_session
    redirect '/cards/1'
  else
    redirect "/?alert=Your password is invalid"
  end

end

get '/signup' do
  erb :signup
end

post '/signup' do
  if User.create(name: params[:name],
    user_password: params[:user_password]).valid?
    redirect '/'
  else
    redirect '/?alert=Username taken!'
  end
end

get '/logout/?' do
  session[:id] = nil
  redirect "/?alert=you are logged out!"
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