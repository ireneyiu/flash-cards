get '/' do
  @alert = params[:alert] if params[:alert]
  erb :index
end

post '/login' do
  authenticate(params)
end

get '/signup' do
  erb :signup
end

post '/signup' do
  user = User.create(name: params[:name],
    user_password: params[:user_password])
  if user.valid?
    session[:id] = user.id
    redirect '/decks'
  else
    redirect '/?alert=Username taken!'
  end
end

get '/logout/?' do
  session[:id] = nil
  clear_last_term
  redirect "/?alert=you are logged out!"
end
