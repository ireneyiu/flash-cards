class User < ActiveRecord::Base
  has_many :decks
  validates_uniqueness_of :name
  validates_presence_of :name, :user_password
end
