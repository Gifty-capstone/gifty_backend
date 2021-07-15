class GiftSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :description, :status
end
