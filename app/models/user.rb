class User < ActiveRecord::Base
  has_many :decks
  has_many :rounds
  validates_uniqueness_of :email
  validates_presence_of :name, :user_password
  validates_presence_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+/

  include BCrypt

  def password
    @password ||= Password.new(user_password)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.user_password = @password
  end

=begin review

Is this necessary?  I don't think so.

ActiveRecord.create should pass an assignment of password i.e. password= to
line 14 for you for FREE!  This is the beauty of overriding methods and
the beauty of BCrypt.

=end

  def self.create(params)
    @user = User.new(params)
    @user.password = params[:user_password]
    @user.save!
    @user
  end
end
