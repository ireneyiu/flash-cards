class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

=begin review
It's unusual to validate a FK presence.  Why not put in a DB constraint?
=end

  validates_presence_of :round_id, :card_id, :correct
end
