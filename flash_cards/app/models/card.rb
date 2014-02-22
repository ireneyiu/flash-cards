class Card < ActiveRecord::Base
  belongs_to :deck
  has_many   :guesses

  validates_uniqueness_of :term
  validates_uniqueness_of :description
  validates_presence_of :term
  validates_presence_of :description
  validates_presence_of :deck_id
end
