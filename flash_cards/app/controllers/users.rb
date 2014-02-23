get '/users/:user_id/rounds' do
  @rounds = User.find(params[:user_id]).rounds

  erb :"rounds/list"
end

