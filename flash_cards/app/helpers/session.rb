helpers do
  def clear_last_term
    session[:last_card_term] = nil
  end

  def set_session_id(user)
    session[:id] = user.id
  end
end