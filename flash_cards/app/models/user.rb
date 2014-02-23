class User < ActiveRecord::Base
  has_many :decks
  has_many :rounds
  validates_uniqueness_of :name
  validates_presence_of :name, :user_password

  include BCrypt

  def password
    @password ||= Password.new(user_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.user_password = @password
  end

  def self.create(params)
    @user = User.new(params[:user])
    @user.password = params[:password]
    @user.save!
    @user
  end


end
