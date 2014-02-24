class Guess < ActiveRecord::Base
  belongs_to :card
  belongs_to :round

  validates_presence_of :round_id, :card_id, :correct
end
