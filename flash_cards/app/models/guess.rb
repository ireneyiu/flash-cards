class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  validates_presence_of :round_id
  validates_presence_of :card_id
  validates_presence_of :correct
end
