class Card < ActiveRecord::Base
  belongs_to :deck

  validates_uniqueness_of :term, :description

=begin review
It's unusual to validate a FK presence.  Why not put in a DB constraint?
=end

  validates_presence_of :term, :description, :deck_id

end
