class Round < ActiveRecord::Base
  belongs_to :deck

=begin review
It's unusual to validate a FK presence.  Why not put in a DB constraint?
=end

  validates_presence_of :deck_id
end
