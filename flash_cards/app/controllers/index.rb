get '/' do
  erb :index
end

post '/login' do
  user = User.find_by_name(params[:name])
  set_session_id(user) unless user.nil?
  redirect '/decks'
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(name: params[:name],
    user_password: params[:user_password])
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
