class FriendSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :birthday, :id

  attribute :need_gift do |object|
    object.need_gift
  end
end
