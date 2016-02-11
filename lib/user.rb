class User
  include DataMapper::Resource

  has n, :links, through: Resource

  property :id,       Serial
  property :username, String
  property :email,    String
  property :password, String
end
