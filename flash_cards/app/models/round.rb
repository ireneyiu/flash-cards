class Round < ActiveRecord::Base
  belongs_to :deck

  validates_presence_of :deck_id
end
