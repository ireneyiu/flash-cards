helpers do
  def authenticate(params)
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
      redirect '/decks'
    else
      redirect "/?alert=Your password is invalid"
    end
  end

  def login?
    !!session[:id]
  end

end