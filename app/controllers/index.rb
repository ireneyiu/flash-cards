get '/' do
=begin review
Guard Clause helps simplify conditionals

redirect '/decks' unless logged_in?
erb :index

=end
  if logged_in?
    redirect '/decks'
  else
    erb :index
  end
end

get '/login' do
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


=begin review
  why the ? thing?
=end

get '/logout/?' do
  session[:id] = nil
  redirect '/'
end

