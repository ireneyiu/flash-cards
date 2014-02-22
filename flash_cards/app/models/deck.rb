class Deck < ActiveRecord::Base
  has_many :cards
  has_many :rounds

  validates_presence_of :name
end
