class UserSerializer
  include FastJsonapi::ObjectSerializer

  attributes :name, :email, :birthday
  has_many :friends
end
