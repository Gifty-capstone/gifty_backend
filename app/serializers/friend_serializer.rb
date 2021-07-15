class FriendSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :birthday, :id, :memo
  has_many :gifts

  attribute :need_gift do |object|
    object.need_gift
  end
end
