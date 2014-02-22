def guess_helper(correct)
  remaining_cards = session[ :remaining_cards ]
  session[:last_correct] = correct
  session[:last_card] = remaining_cards.first
  if correct
    @round.correct += 1
    session[:remaining_cards] = remaining_cards[1..-1]
  else
    @round.incorrect += 1
    session[:remaining_cards] = remaining_cards.shuffle
  end
  @round.save
end