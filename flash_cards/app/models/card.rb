class Card < ActiveRecord::Base
  belongs_to :deck

  validates_uniqueness_of :term, :description
  validates_presence_of :term, :description, :deck_id
end
