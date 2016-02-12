require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  # has n, :tags, through: Resource
  property :id,               Serial
  property :email,            String, required: true
  property :password_digest,  Text, required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_format_of :email, as: :email_address
  validates_confirmation_of :password
  validates_uniqueness_of :email

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
end
