class FriendSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :birthday, :id, :memo
  has_many :gifts

  attribute :need_gift, &:need_gift
end
