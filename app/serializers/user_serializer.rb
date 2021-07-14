class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :email, :birthday, :icon
  has_many :friends


end
