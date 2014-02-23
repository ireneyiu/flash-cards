get '/' do
  @alert = params[:alert] if params[:alert]
  erb :index
end


post '/' do
  authenticate(params)
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
