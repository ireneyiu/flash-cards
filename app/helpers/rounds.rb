def guess_helper(correct)

=begin review
no spaces around key for hash.  nobody does that.
=end


=begin review

I think you guys are abusing the poor session.

You're stuffing it with all sorts of data about cards and your position in the
card deck.  I think it would be much nicer if you were to create a table-based
model to track a user's playing the game.  You could then store the user_id,
the deck_id, the deck_position.  Then, instead of having to write helper
methods you could do something like this on your model.

Come to think of that shouldn't that be a responsibility of a Round class to
track?

Maybe you could tell the session which Round to track for the user but then
put all that logic on the Round class?

=end

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
