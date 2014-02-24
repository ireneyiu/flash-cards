=begin review

  current_user is super confusing.  I'm expecting a User instance
  you're requiring me to think about binding rules between ||= and &&.

  based on this I'm thinking that I will get back a true or false some
  times and a User instance some other times.

=end

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
