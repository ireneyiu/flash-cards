helpers do
  def clear_last_term
    session[:last_card_term] = nil
  end


=begin review

I'm not sure this is helping very much.  I'm OK with you exposing the guts of a
session activity in the controller.

=end

  def set_session_id(user)
    session[:id] = user.id
  end
end
