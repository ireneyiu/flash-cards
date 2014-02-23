helpers do
  def current_user
    @current_user ||= session[:id] && User.find_by_id(session[:id])
  end

  def logged_in?
    !!session[:id]
  end

  def login
    @user = User.find_by_name(params[:name])
    if @user && @user.password == params[:password]
      set_session_id(@user)
      redirect '/decks'
    else
      @errors = ["Invalid username or password."]
      erb :index
    end
  end
end