get '/' do
  erb :index
end

post '/login' do
  login
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(params)
  if user.valid?
    set_session_id(user)
    redirect '/decks'
  else
    @errors = user.errors.full_messages
    erb :index
  end
end

get '/logout/?' do
  session[:id] = nil
  redirect '/'
end
